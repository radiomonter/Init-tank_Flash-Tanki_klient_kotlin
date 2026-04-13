package com.tanki.client.network

import org.slf4j.LoggerFactory
import java.net.Socket
import java.net.SocketTimeoutException
import java.io.ByteArrayOutputStream
import kotlin.concurrent.thread
import com.tanki.client.models.UserModel
import com.tanki.client.models.News
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject


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
class NetworkManager : KoinComponent {



    private val logger = LoggerFactory.getLogger(NetworkManager::class.java)
    private val userModel: UserModel by inject()

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
    private var newsUsername: String? = null // Separate variable for news username

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
        println("===== RECEIVE LOOP STARTED =====")
        logger.info("===== RECEIVE LOOP STARTED =====")
        val buf = StringBuilder()
        val raw = ByteArray(4096)
        try {
            val ins = inputStream ?: return
            while (isConnected) {
                val n = try { ins.read(raw) } catch (e: SocketTimeoutException) { continue }
                if (n == -1) break

                // Convert bytes to string and append to buffer
                val chunk = String(raw, 0, n, Charsets.UTF_8)
                buf.append(chunk)

                // Search for packet delimiter
                val packetStr = findPacket(buf)
                if (packetStr != null) {
                    val decrypted = decrypt(packetStr)
                    if (decrypted != null && decrypted.isNotEmpty()) {
                        println("===== PACKET FOUND: $decrypted =====")
                        logger.info("===== PACKET FOUND: $decrypted =====")
                        processPacket(decrypted)
                    }
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

private fun findPacket(buf: StringBuilder): String? {
        val data = buf.toString()
        val dnePos = data.indexOf("~dne")
        if (dnePos == -1) return null
        
        val packetStr = data.substring(0, dnePos)
        buf.delete(0, dnePos + 4)
        return packetStr
    }

private fun ByteArray.indexOfSequence(seq: ByteArray): Int {
        outer@ for (i in indices) {
            for (j in seq.indices) {
                if (i + j >= size || this[i + j] != seq[j]) continue@outer
            }
            return i
        }
        return -1
    }

    // ── Encryption ────────────────────────────────────────────────────────────

/** Decrypt: first char is key digit, rest = char.code - (key+1) */
    private fun decrypt(encrypted: String): String? {
        if (encrypted.isEmpty()) return null
        
        // Check if this is an unencrypted server command (Category::Command [args])
        if (encrypted.contains("::") || encrypted.contains("[") || encrypted.contains("]")) {
            logger.info("Unencrypted server command detected: $encrypted")
            return encrypted
        }
        
        return try {
            // Flash algorithm: key is ALWAYS first character, format is ALWAYS key + data
            // Keys cycle through 1-9
            val key = encrypted[0].toString().toInt()
            val data = encrypted.drop(1)
            
            // Apply decryption exactly like Flash: char.code - (key + 1)
            val decrypted = data.map { c -> 
                val newCode = c.code - (key + 1)
                if (newCode > 0) Char(newCode) else c
            }.joinToString("")
            
            // Fix UTF-8 encoding issue - convert from wrong encoding to proper UTF-8
            val result = try {
                // Convert the string to bytes using the wrong encoding, then decode as UTF-8
                val bytes = decrypted.toByteArray(Charset.forName("ISO-8859-1"))
                String(bytes, Charset.forName("UTF-8"))
            } catch (e: Exception) {
                // If conversion fails, return original decrypted string
                decrypted
            }
            
            // Log for news and debugging
            if (result.contains("show_news") || result.contains("init_messages") || result.contains("\"news\"")) {
                logger.info("=== DECRYPT DEBUG ===")
                logger.info("Encrypted: $encrypted")
                logger.info("Key: $key")
                logger.info("Data to decrypt: $data")
                logger.info("Decrypted: $result")
                logger.info("=== END DEBUG ===")
            }
            
            logger.debug("Decrypted: $encrypted -> $result (key: $key)")
            result
            
        } catch (e: Exception) {
            logger.warn("Decrypt failed: $encrypted: ${e.message}")
            // Try without decryption for unencrypted packets
            if (encrypted.contains("auth") || encrypted.contains("system")) {
                logger.info("Trying without decryption for: $encrypted")
                encrypted
            } else null
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
        println("===== PROCESS PACKET CALLED =====")
        println("PACKET: $packet")
        logger.info("!!! INCOMING PACKET: $packet")
        logger.info("<- PACKET: $packet")
        
        // Log all packets for debugging
        println("=== PACKET ANALYSIS ===")
        println("Length: ${packet.length}")
        println("Contains 'news': ${packet.contains("news")}")
        println("Contains 'show_news': ${packet.contains("show_news")}")
        println("Contains 'init_messages': ${packet.contains("init_messages")}")
        println("Contains 'lobby': ${packet.contains("lobby")}")
        println("=== END ANALYSIS ===")

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
                // Keep pendingUsername for news parsing - don't clear it yet
                onLoginSuccess?.invoke(username)
            }

            name == "accept" && category == "auth" -> {
                logger.info("Login accepted (accept)")
                state = State.AUTHENTICATED
                val username = pendingUsername ?: "Player"
                // Keep pendingUsername for news parsing - don't clear it yet
                onLoginSuccess?.invoke(username)
            }

            name == "denied" && category == "auth" -> {
                logger.warn("Login denied: $args")
                onLoginFailed?.invoke("Неверный логин или пароль")
            }

            name == "init_panel" || name == "initpanel" -> {
                val panelUsername = extractString(args, "name") ?: "Player"
                logger.info("Got initpanel, panelUsername=$panelUsername, current pendingUsername=$pendingUsername, newsUsername=$newsUsername")
                // Only update pendingUsername if it's not already set from login
                if (pendingUsername == null) {
                    pendingUsername = panelUsername
                    logger.info("Updated pendingUsername from initpanel: $pendingUsername")
                }
                // Also set newsUsername if not already set
                if (newsUsername == null) {
                    newsUsername = panelUsername
                    logger.info("Updated newsUsername from initpanel: $newsUsername")
                }
                // If already authenticated, fire success now (initpanel comes after authaccept)
                if (state == State.AUTHENTICATED) {
                    val username = pendingUsername ?: "Player"
                    logger.info("Authentication complete, username: $username")
                    // Don't clear pendingUsername yet - keep it for news
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
                // Parse news and save to UserModel
                logger.info("!!! Checking news condition: name='$name', category='$category'")
                if ((name == "show_news" && category == "lobby") || (name == "init_messages" && category == "lobby_chat")) {
                    logger.info("!!! NEWS CONDITION MATCHED! Processing news...")
                    try {
                        logger.info("=== RAW SERVER NEWS DATA ===")
                        logger.info("Category: $category, Name: $name")
                        logger.info("Raw args (first 1000 chars): ${args.take(1000)}")
                        logger.info("Raw args bytes: ${args.toByteArray(Charsets.UTF_8).contentToString()}")
                        logger.info("=== END RAW DATA ===")
                        
                        val username = newsUsername ?: pendingUsername ?: "Player"
                        
                        val newsArrayMatch = if (category == "lobby_chat") {
                            Regex("\"news\"\\s*:\\s*\\[\\s*\\{(.*?)\\}").find(args)
                        } else {
                            Regex("\\[\\s*\\{(.*?)\\}\\s*\\]").find(args)
                        }
                        
                        val newsObj = newsArrayMatch?.groupValues?.get(1) ?: throw Exception("No news array")
                        logger.info("News object extracted: $newsObj")
                        logger.info("Full args received: ${args.take(500)}...")
                        val id = extractString(newsObj, "id") ?: "unknown"
                        val header = fixMySQLEncoding(extractString(newsObj, "header") ?: "News").replace("%USERNAME%", username)
                        val text = fixMySQLEncoding(extractString(newsObj, "text") ?: "")
                        val date = extractString(newsObj, "date") ?: ""
                        val image = extractString(newsObj, "image")
                        
                        // Create News object and save to UserModel
                        val news = News(id, header, text, date, image)
                        userModel.setNews(news)
                        
                        logger.info("News saved to UserModel: $id")
                        logger.info("Parsed - ID: $id, Header: $header, Date: $date, Text length: ${text.length}")
                        
                        // Verify news was saved
                        val verifyNews = userModel.currentNews
                        logger.info("News verification after save: ${verifyNews?.header} (ID: ${verifyNews?.id})")
                    } catch (e: Exception) {
                        logger.warn("News parse error: ${e.message}")
                        logger.warn("Args preview: ${args.take(300)}...")
                    }
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
        // Set username for news parsing
        pendingUsername = user
        newsUsername = user // Store in separate variable that won't be reset
        logger.info("Set pendingUsername to: $user, newsUsername to: $user")
        // Server expects 4 separate args: captcha;rememberMe;login;password
        sendPacket("auth;login;;false;$user;$pass")
        logger.info("Sent login for: $user")
    }

    private fun extractString(json: String, key: String): String? {
        val result = Regex(""""$key"\s*:\s*"([^"]*)"""").find(json)?.groupValues?.get(1)
        logger.info("!!! extractString: key='$key', result='$result'")
        logger.info("extractString: key='$key', result='$result', json preview='${json.take(200)}...'")
        return result
    }

private fun fixMySQLEncoding(text: String): String {
        logger.debug("fixMySQLEncoding input length=${text.length}: '${text.take(100)}...'")
        return try {
            // Now with proper byte decrypt, should be UTF-8; fallback latin1->UTF8 for utf8mb3 issues
            if (text.contains("\uFFFD") || text.matches(Regex("[\\u?\\uFFFD]+"))) { // Repl chars
                val bytes = text.toByteArray(Charsets.ISO_8859_1)
                val result = String(bytes, Charsets.UTF_8)
                logger.info("Fixed latin1->UTF8: '$result'")
                result
            } else {
                text
            }
        } catch (e: Exception) {
            logger.warn("fixMySQLEncoding failed: ${e.message}")
            text
        }
    }

    private fun fixCyrillicEncoding(text: String): String {
        return fixMySQLEncoding(text) // Reuse the MySQL encoding fix
    }

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
