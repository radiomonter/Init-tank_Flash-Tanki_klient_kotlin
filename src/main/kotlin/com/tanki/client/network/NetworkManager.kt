package com.tanki.client.network

import org.slf4j.LoggerFactory
import java.net.Socket
import java.net.SocketTimeoutException
import kotlin.concurrent.thread

/**
 * TCP client for the FlashTanki server protocol.
 *
 * Encryption: first byte = key (1-8), rest = char.code + (key+1), delimiter = "~dne"
 * Keys rotate: lastKey = (lastKey + 1) % 9, if <= 0 then 1
 *
 * Handshake (client initiates):
 *   client → system;get_aes_data;ru
 *   server → system;set_aes_data;...   (ignored)
 *   server → system;load_resources;<json>;<depId>
 *   client → system;dependencies_loaded;<depId>
 *   server → system;main_resources_loaded
 *   client → auth;login;{...}
 *   server → auth;accept  OR  auth;denied
 */
class NetworkManager {

    private val logger = LoggerFactory.getLogger(NetworkManager::class.java)

    private var socket: Socket? = null
    private var outputStream: java.io.OutputStream? = null
    private var inputStream: java.io.InputStream? = null

    // Encryption state — mirrors server EncryptionTransformer
    private var lastSendKey = 1
    private var lastRecvKey = 1

    private enum class State { IDLE, CONNECTING, HANDSHAKE, READY, AUTHENTICATED }
    private var state = State.IDLE

    private var pendingLogin: Pair<String, String>? = null
    private var pendingUsername: String? = null

    // ── Public callbacks ──────────────────────────────────────────────────────

    var onConnected: (() -> Unit)? = null
    var onDisconnected: (() -> Unit)? = null
    var onLoginSuccess: ((username: String) -> Unit)? = null
    var onLoginFailed: ((reason: String) -> Unit)? = null
    var onCommand: ((category: String, name: String, args: String) -> Unit)? = null
    var onBattleList: ((battles: List<BattleInfo>) -> Unit)? = null

    data class BattleInfo(
        val battleId: String,
        val name: String,
        val map: String,
        val mode: String,
        val users: Int,
        val maxPeople: Int,
        val minRank: Int,
        val maxRank: Int
    )

    val isConnected: Boolean
        get() = socket?.isConnected == true && socket?.isClosed == false

    // ── Lifecycle ─────────────────────────────────────────────────────────────

    fun initialize() {
        logger.info("NetworkManager initialised")
    }

    fun update() {}

    // ── Public API ────────────────────────────────────────────────────────────

    fun login(username: String, password: String) {
        pendingLogin = Pair(username, password)
        if (!isConnected) {
            connect()
        } else if (state == State.READY || state == State.AUTHENTICATED) {
            flushPendingLogin()
        }
    }

    fun connect(host: String = "127.0.0.1", port: Int = 2351) {
        if (state != State.IDLE) return
        state = State.CONNECTING
        thread(name = "net-connect", isDaemon = true) {
            try {
                logger.info("Connecting to $host:$port …")
                val s = Socket(host, port)
                s.soTimeout = 0
                s.tcpNoDelay = true
                socket       = s
                outputStream = s.getOutputStream()
                inputStream  = s.getInputStream()
                lastSendKey  = 1
                lastRecvKey  = 1
                state        = State.HANDSHAKE
                logger.info("Connected")
                onConnected?.invoke()

                // Client initiates — send locale
                sendPacket("system;get_aes_data;RU")
                logger.debug("Sent get_aes_data")

                receiveLoop()
            } catch (e: Exception) {
                logger.error("Connection failed: ${e.message}")
                state = State.IDLE
                onLoginFailed?.invoke("Не удалось подключиться: ${e.message}")
                onDisconnected?.invoke()
            }
        }
    }

    fun disconnect() {
        try { socket?.close() } catch (_: Exception) {}
        socket       = null
        outputStream = null
        inputStream  = null
        state        = State.IDLE
    }

    fun dispose() {
        disconnect()
        logger.info("NetworkManager disposed")
    }

    // ── Receive loop ──────────────────────────────────────────────────────────

    private fun receiveLoop() {
        val buf = StringBuilder()
        val raw = ByteArray(4096)
        try {
            val ins = inputStream ?: return
            while (isConnected) {
                val n = try { ins.read(raw) } catch (e: SocketTimeoutException) { continue }
                if (n == -1) break

                // Log raw bytes for debugging
                val hex = raw.take(n).joinToString(" ") { "%02X".format(it) }
                val txt = raw.take(n).map { if (it in 32..126) it.toInt().toChar() else '.' }.joinToString("")
                logger.debug("RAW [$n bytes] hex=$hex  txt=$txt")

                for (i in 0 until n) buf.append(raw[i].toInt().toChar())

                var idx: Int
                while (buf.indexOf("~dne").also { idx = it } != -1) {
                    val packet = buf.substring(0, idx)
                    buf.delete(0, idx + 4)
                    if (packet.isNotEmpty()) processPacket(packet)
                }
            }
        } catch (e: Exception) {
            if (isConnected) logger.error("Receive error: ${e.message}")
        } finally {
            logger.info("Disconnected")
            state = State.IDLE
            onDisconnected?.invoke()
        }
    }

    // ── Encryption ────────────────────────────────────────────────────────────

    /** Decrypt: first char is key digit, rest = char.code - (key+1) */
    private fun decrypt(encrypted: String): String? {
        if (encrypted.isEmpty()) return null
        return try {
            val key = encrypted[0].toString().toInt()
            encrypted.drop(1).map { c -> Char(c.code - (key + 1)) }.joinToString("")
        } catch (e: Exception) {
            logger.warn("Failed to decrypt: $encrypted")
            null
        }
    }

    /** Encrypt: prepend key digit, each char += (key+1) */
    private fun encrypt(plain: String): String {
        var key = (lastSendKey + 1) % 9
        if (key <= 0) key = 1
        lastSendKey = key
        return key.toString() + plain.map { c -> Char(c.code + (key + 1)) }.joinToString("")
    }

    // ── Packet handling ───────────────────────────────────────────────────────

    private fun processPacket(packet: String) {
        logger.info("← PACKET: $packet")

        // Support both "category;name;args" and "Category::Name;args" formats
        val category: String
        val name: String
        val args: String

        if (packet.contains("::")) {
            // Format: "Category::CommandName;args" or "Category::CommandName"
            val colonIdx = packet.indexOf("::")
            val rawCat   = packet.substring(0, colonIdx).lowercase()
            val rest     = packet.substring(colonIdx + 2)
            val semiIdx  = rest.indexOf(';')
            if (semiIdx >= 0) {
                category = rawCat
                name     = rest.substring(0, semiIdx).lowercase()
                args     = rest.substring(semiIdx + 1)
            } else {
                category = rawCat
                name     = rest.lowercase()
                args     = ""
            }
        } else {
            val parts = packet.split(";", limit = 3)
            category  = parts.getOrElse(0) { "" }.lowercase()
            name      = parts.getOrElse(1) { "" }.lowercase()
            args      = parts.getOrElse(2) { "" }
        }

        logger.debug("  category=$category  name=$name  args=${args.take(120)}")

        when {
            name == "load_resources" || name == "loadresources" -> {
                // args may be: "<json>;<depId>" or just "<depId>" or empty
                val lastSemi = args.lastIndexOf(';')
                val depId = when {
                    args.isEmpty()  -> "1"
                    lastSemi >= 0   -> args.substring(lastSemi + 1).trim().ifEmpty { "1" }
                    else            -> args.trim().ifEmpty { "1" }
                }
                logger.info("load_resources depId=$depId → sending dependencies_loaded")
                sendPacket("system;dependencies_loaded;$depId")
            }

            name == "main_resources_loaded" || name == "mainresourcesloaded" -> {
                logger.info("Handshake complete — server ready for auth")
                state = State.READY
                flushPendingLogin()
            }

            name == "authaccept" && category == "auth" -> {
                logger.info("Login accepted (authaccept)")
                state = State.AUTHENTICATED
                val username = pendingUsername ?: "Player"
                pendingUsername = null
                onLoginSuccess?.invoke(username)
            }

            name == "accept" && category == "auth" -> {
                logger.info("Login accepted (accept)")
                state = State.AUTHENTICATED
                val username = pendingUsername ?: "Player"
                pendingUsername = null
                onLoginSuccess?.invoke(username)
            }

            name == "denied" && category == "auth" -> {
                logger.warn("Login denied: $args")
                onLoginFailed?.invoke("Неверный логин или пароль")
            }

            name == "init_panel" || name == "initpanel" -> {
                pendingUsername = extractString(args, "name") ?: "Player"
                logger.info("Got initpanel, username=${pendingUsername}")
                // If already authenticated, fire success now (initpanel comes after authaccept)
                if (state == State.AUTHENTICATED) {
                    val username = pendingUsername ?: "Player"
                    pendingUsername = null
                    onLoginSuccess?.invoke(username)
                }
                onCommand?.invoke(category, name, args)
            }

            else -> {
                logger.debug("  (unhandled) category=$category name=$name")
                // Parse battle list
                if (name == "initbattleselect" && category == "lobby") {
                    val battles = parseBattleList(args)
                    onBattleList?.invoke(battles)
                }
                onCommand?.invoke(category, name, args)
            }
        }
    }

    // ── Send ──────────────────────────────────────────────────────────────────

    fun sendCommand(category: String, name: String, args: String = "") {
        val raw = if (args.isEmpty()) "$category;$name" else "$category;$name;$args"
        sendPacket(raw)
    }

    private fun sendPacket(plain: String) {
        try {
            val encrypted = encrypt(plain) + "~dne"
            outputStream?.write(encrypted.toByteArray(Charsets.UTF_8))
            outputStream?.flush()
            logger.debug("→ $plain")
        } catch (e: Exception) {
            logger.error("Send error: ${e.message}")
        }
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private fun flushPendingLogin() {
        val (user, pass) = pendingLogin ?: return
        pendingLogin = null
        // Server expects 4 separate args: captcha;rememberMe;login;password
        sendPacket("auth;login;;false;$user;$pass")
        logger.info("Sent login for: $user")
    }

    private fun extractString(json: String, key: String): String? =
        Regex(""""$key"\s*:\s*"([^"]*)"""").find(json)?.groupValues?.get(1)

    private fun parseBattleList(json: String): List<BattleInfo> {
        val result = mutableListOf<BattleInfo>()
        // Simple regex-based extraction of each battle object
        val battleRegex = Regex("""\{[^{}]*"battleId"\s*:\s*"([^"]+)"[^{}]*\}""")
        for (match in battleRegex.findAll(json)) {
            val obj = match.value
            fun str(k: String) = Regex(""""$k"\s*:\s*"([^"]*)"""").find(obj)?.groupValues?.get(1) ?: ""
            fun int(k: String) = Regex(""""$k"\s*:\s*(\d+)""").find(obj)?.groupValues?.get(1)?.toIntOrNull() ?: 0
            // count users array elements
            val usersCount = Regex(""""users"\s*:\s*\[([^\]]*)\]""").find(obj)
                ?.groupValues?.get(1)?.split(",")?.count { it.contains('"') } ?: 0
            result += BattleInfo(
                battleId   = str("battleId"),
                name       = str("name"),
                map        = str("map"),
                mode       = str("battleMode"),
                users      = usersCount,
                maxPeople  = int("maxPeople"),
                minRank    = int("minRank"),
                maxRank    = int("maxRank")
            )
        }
        return result
    }
}
