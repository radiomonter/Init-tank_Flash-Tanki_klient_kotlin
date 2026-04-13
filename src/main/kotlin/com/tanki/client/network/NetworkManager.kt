package com.tanki.client.network

import org.slf4j.LoggerFactory
import java.net.Socket
import java.net.SocketTimeoutException
import java.nio.charset.Charset
import kotlin.concurrent.thread
import com.tanki.client.models.UserModel
import com.tanki.client.models.NewsModel
import com.tanki.client.models.News
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

/**
 * TCP client for the FlashTanki server protocol.
 *
 * Encryption: first byte = key (1-8), rest = char.code + (key+1), delimiter = "~dne"
 * Server sends plain text, client encrypts outgoing packets.
 *
 * Handshake:
 *   client → system;get_aes_data;RU
 *   server → system;load_resources;...;<depId>   (repeat until done)
 *   client → system;dependencies_loaded;<depId>
 *   server → system;main_resources_loaded
 *   client → auth;login;;false;<user>;<pass>
 *   server → auth;authaccept
 *   server → lobby;initpanel;{...}
 */
class NetworkManager : KoinComponent {

    private val logger = LoggerFactory.getLogger(NetworkManager::class.java)
    private val userModel: UserModel by inject()
    private val newsModel: NewsModel by inject()

    private var socket: Socket? = null
    private var outputStream: java.io.OutputStream? = null
    private var inputStream: java.io.InputStream? = null

    private var lastSendKey = 1

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

    fun initialize() { logger.info("NetworkManager initialised") }
    fun update() {}

    // ── Public API ────────────────────────────────────────────────────────────

    fun login(username: String, password: String) {
        pendingLogin = Pair(username, password)
        if (!isConnected) connect()
        else if (state == State.READY || state == State.AUTHENTICATED) flushPendingLogin()
    }

    fun connect(host: String = "127.0.0.1", port: Int = 2351) {
        if (state != State.IDLE) return
        state = State.CONNECTING
        thread(name = "net-connect", isDaemon = true) {
            try {
                logger.info("Connecting to $host:$port …")
                val s = Socket(host, port)
                s.soTimeout = 0; s.tcpNoDelay = true
                socket = s; outputStream = s.getOutputStream(); inputStream = s.getInputStream()
                lastSendKey = 1
                state = State.HANDSHAKE
                logger.info("Connected")
                onConnected?.invoke()
                sendPacket("system;get_aes_data;RU")
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
        socket = null; outputStream = null; inputStream = null
        state = State.IDLE
    }

    fun dispose() { disconnect(); logger.info("NetworkManager disposed") }

    fun sendCommand(category: String, name: String, args: String = "") {
        sendPacket(if (args.isEmpty()) "$category;$name" else "$category;$name;$args")
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
                buf.append(String(raw, 0, n, Charsets.UTF_8))
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

    private fun encrypt(plain: String): String {
        var key = (lastSendKey + 1) % 9
        if (key <= 0) key = 1
        lastSendKey = key
        return key.toString() + plain.map { c -> Char(c.code + (key + 1)) }.joinToString("")
    }

    // ── Packet handling ───────────────────────────────────────────────────────

    private fun processPacket(packet: String) {
        logger.debug("← $packet")

        val category: String; val name: String; val args: String
        if (packet.contains("::")) {
            val ci = packet.indexOf("::")
            val cat = packet.substring(0, ci).lowercase()
            val rest = packet.substring(ci + 2)
            val si = rest.indexOf(';')
            if (si >= 0) { category = cat; name = rest.substring(0, si).lowercase(); args = rest.substring(si + 1) }
            else         { category = cat; name = rest.lowercase(); args = "" }
        } else {
            val p = packet.split(";", limit = 3)
            category = p.getOrElse(0) { "" }.lowercase()
            name     = p.getOrElse(1) { "" }.lowercase()
            args     = p.getOrElse(2) { "" }
        }

        logger.debug("  cat=$category name=$name args=${args.take(80)}")

        when {
            name == "load_resources" || name == "loadresources" -> {
                val lastSemi = args.lastIndexOf(';')
                val depId = when {
                    args.isEmpty() -> "1"
                    lastSemi >= 0  -> args.substring(lastSemi + 1).trim().ifEmpty { "1" }
                    else           -> args.trim().ifEmpty { "1" }
                }
                logger.info("load_resources depId=$depId")
                sendPacket("system;dependencies_loaded;$depId")
            }

            name == "main_resources_loaded" || name == "mainresourcesloaded" -> {
                logger.info("Handshake complete")
                state = State.READY
                flushPendingLogin()
            }

            (name == "authaccept" || name == "accept") && category == "auth" -> {
                logger.info("Auth accepted")
                state = State.AUTHENTICATED
                // username will come from initpanel — wait for it
            }

            name == "denied" && category == "auth" -> {
                logger.warn("Auth denied")
                onLoginFailed?.invoke("Неверный логин или пароль")
            }

            name == "initpanel" || name == "init_panel" -> {
                val username  = extractString(args, "name") ?: pendingUsername ?: "Player"
                val rank      = extractInt(args, "rang")
                val crystals  = extractInt(args, "crystall")
                val score     = extractLong(args, "score")
                val nextScore = extractLong(args, "next_score")
                val premium   = args.contains("\"hasDoubleCrystal\":true")
                userModel.setFromServer(username, rank, crystals, score, nextScore, premium)
                pendingUsername = username
                if (state == State.AUTHENTICATED) {
                    onLoginSuccess?.invoke(username)
                }
                onCommand?.invoke(category, name, args)
            }

            // News — parse and save to UserModel, then fire onLoginSuccess if needed
            (name == "shownews" || name == "show_news") && category == "lobby" -> {
                parseAndSaveNews(args)
                onCommand?.invoke(category, name, args)
            }

            name == "initbattleselect" && category == "lobby" -> {
                onBattleList?.invoke(parseBattleList(args))
                onCommand?.invoke(category, name, args)
            }

            else -> onCommand?.invoke(category, name, args)
        }
    }

    // ── News ──────────────────────────────────────────────────────────────────

    private fun parseAndSaveNews(args: String) {
        try {
            val username = pendingUsername ?: userModel.getCurrentUser()?.username ?: "Player"
            logger.info("parseAndSaveNews: username=$username args=${args.take(200)}")

            // args = [{"id":"1","header":"...","text":"...","date":"...","image":"..."}]
            // Find first { ... } block (the first news item)
            val start = args.indexOf('{')
            val end   = args.lastIndexOf('}')
            if (start == -1 || end == -1 || end <= start) {
                logger.warn("parseAndSaveNews: no JSON object found in args")
                return
            }
            val obj = args.substring(start + 1, end)

            val id     = extractString(obj, "id")     ?: return
            val header = (extractString(obj, "header") ?: "").replace("%USERNAME%", username)
            val text   = extractString(obj, "text")   ?: ""
            val date   = extractString(obj, "date")   ?: ""
            val image  = extractString(obj, "image")

            newsModel.setNews(News(id, header, text, date, image))
            logger.info("News saved: id=$id header=$header date=$date")
        } catch (e: Exception) {
            logger.warn("News parse error: ${e.message}")
        }
    }

    // ── Send ──────────────────────────────────────────────────────────────────

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
        pendingUsername = user
        sendPacket("auth;login;;false;$user;$pass")
        logger.info("Sent login for: $user")
    }

    private fun extractString(json: String, key: String): String? {
        // Matches "key":"value" where value may contain escaped chars like \" \n \t
        val regex = Regex(""""$key"\s*:\s*"((?:[^"\\]|\\.)*)"""")
        return regex.find(json)?.groupValues?.get(1)
            ?.replace("\\n", "\n")
            ?.replace("\\t", "\t")
            ?.replace("\\\"", "\"")
            ?.replace("\\\\", "\\")
    }

    private fun extractInt(json: String, key: String): Int =
        Regex(""""$key"\s*:\s*(\d+)""").find(json)?.groupValues?.get(1)?.toIntOrNull() ?: 0

    private fun extractLong(json: String, key: String): Long =
        Regex(""""$key"\s*:\s*(\d+)""").find(json)?.groupValues?.get(1)?.toLongOrNull() ?: 0L

    private fun parseBattleList(json: String): List<BattleInfo> {
        val result = mutableListOf<BattleInfo>()
        val battleRegex = Regex("""\{[^{}]*"battleId"\s*:\s*"([^"]+)"[^{}]*\}""")
        for (match in battleRegex.findAll(json)) {
            val obj = match.value
            fun str(k: String) = Regex(""""$k"\s*:\s*"([^"]*)"""").find(obj)?.groupValues?.get(1) ?: ""
            fun int(k: String) = Regex(""""$k"\s*:\s*(\d+)""").find(obj)?.groupValues?.get(1)?.toIntOrNull() ?: 0
            val usersCount = Regex(""""users"\s*:\s*\[([^\]]*)\]""").find(obj)
                ?.groupValues?.get(1)?.split(",")?.count { it.contains('"') } ?: 0
            result += BattleInfo(str("battleId"), str("name"), str("map"), str("battleMode"),
                usersCount, int("maxPeople"), int("minRank"), int("maxRank"))
        }
        return result
    }
}
