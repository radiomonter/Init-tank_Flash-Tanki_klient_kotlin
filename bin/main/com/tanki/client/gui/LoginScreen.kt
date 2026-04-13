package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.InputAdapter
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.auth.AuthService
import com.tanki.client.gui.UIManager
import com.tanki.client.gui.ScreenType
import com.tanki.client.models.News
import com.tanki.client.models.UserModel
import com.tanki.client.network.NetworkManager
import com.tanki.client.utils.makeFont
import com.tanki.client.utils.SimpleTextRenderer
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class LoginScreen : UIScreen(), KoinComponent {

    private val logger = LoggerFactory.getLogger("LoginScreen")
    private val networkManager: NetworkManager by inject()
    private val uiManager: UIManager by inject()
    private val userModel: com.tanki.client.models.UserModel by inject()

    private var logoFont:   BitmapFont? = null
    private var labelFont:  BitmapFont? = null
    private var inputFont:  BitmapFont? = null
    private var smallFont:  BitmapFont? = null
    private var buttonFont: BitmapFont? = null

    private var loginField:    TextField? = null
    private var passwordField: TextField? = null

    private var activeField  = ""
    private var login        = ""
    private var password     = ""
    private var errorMessage = ""
    private var isLoggingIn  = false

    private var playButton:     Button? = null
    private var guestButton:    Button? = null
    private var registerButton: Button? = null

    private var panelX = 0f
    private var panelW = 0f
    private var uiBuilt = false

    // InputProcessor that captures typed characters
    private val inputProcessor = object : InputAdapter() {
        override fun keyTyped(character: Char): Boolean {
            if (activeField.isEmpty()) return false
            when (character) {
                '\b' -> {
                    // backspace handled here too
                    if (activeField == "login" && login.isNotEmpty())       login    = login.dropLast(1)
                    if (activeField == "password" && password.isNotEmpty()) password = password.dropLast(1)
                }
                '\r', '\n' -> attemptLogin()
                '\t' -> activeField = if (activeField == "login") "password" else "login"
                else -> if (character.code >= 32) {
                    if (activeField == "login")    login    += character
                    if (activeField == "password") password += character
                }
            }
            return true
        }

        override fun touchDown(screenX: Int, screenY: Int, pointer: Int, button: Int): Boolean {
            val mx = screenX.toFloat()
            val my = Gdx.graphics.height - screenY.toFloat()
            activeField = when {
                loginField?.contains(mx, my) == true    -> "login"
                passwordField?.contains(mx, my) == true -> "password"
                else -> ""
            }
            if (!isLoggingIn) {
                playButton?.checkClick(mx, my)
                guestButton?.checkClick(mx, my)
                registerButton?.checkClick(mx, my)
            }
            return true
        }
    }

    override fun show() {
        super.show()
        Gdx.input.inputProcessor = inputProcessor
        setupNetworkCallbacks()
    }

    override fun hide() {
        super.hide()
        Gdx.input.inputProcessor = null
    }

    private fun ensureFontsAndUI() {
        if (uiBuilt) return
        uiBuilt = true

        logoFont   = makeFont(42)
        labelFont  = makeFont(14)
        inputFont  = makeFont(15)
        smallFont  = makeFont(13)
        buttonFont = makeFont(17)

        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        panelW = w * 0.42f
        panelX = w - panelW
        val fx = panelX + 30f
        val fw = panelW - 60f
        val cy = h / 2f + 60f
        loginField    = TextField(fx, cy,       fw, 42f, "Логин")
        passwordField = TextField(fx, cy - 80f, fw, 42f, "Пароль", isPassword = true)
        val bw = fw; val bh = 48f
        playButton     = Button(fx,              cy - 160f, bw,         bh, "ИГРАТЬ",      { attemptLogin() }, style = ButtonStyle.GREEN)
        guestButton    = Button(fx,              cy - 220f, bw * 0.47f, bh, "ГОСТЬ",       { guestLogin() })
        registerButton = Button(fx + bw * 0.53f, cy - 220f, bw * 0.47f, bh, "РЕГИСТРАЦИЯ", { uiManager.showScreen(ScreenType.REGISTER) })
    }

    private fun setupNetworkCallbacks() {
        networkManager.onLoginSuccess = { username ->
            Gdx.app.postRunnable {
                println("DEBUG: Login success for username: $username")
                isLoggingIn = false
                errorMessage = ""
                uiManager.showScreen(ScreenType.MAIN_MENU)
            }
        }
        networkManager.onLoginFailed = { reason ->
            Gdx.app.postRunnable {
                println("DEBUG: Login failed: $reason")
                isLoggingIn = false
                errorMessage = reason
            }
        }
        networkManager.onCommand = { category, name, args ->
            println("DEBUG: Received command: $category.$name with args: $args")
            if (name == "initpanel" && category == "lobby") {
                val uname    = extractJson(args, "name")    ?: login.trim()
                val rank     = extractJson(args, "rang")?.toIntOrNull()     ?: 1
                val crystals = extractJson(args, "crystall")?.toIntOrNull() ?: 0
                val score    = extractJson(args, "score")?.toLongOrNull()   ?: 0L
                val premium  = extractJson(args, "hasDoubleCrystal") == "true"
                userModel.setFromServer(uname, rank, crystals, score, premium)
            }
        }
    }


    private fun extractJson(json: String, key: String): String? =
        Regex(""""$key"\s*:\s*"?([^",}\]]+)"?""").find(json)?.groupValues?.get(1)?.trim()

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureFontsAndUI()

        val h = Gdx.graphics.height.toFloat()
        val lf    = loginField!!
        val pf    = passwordField!!
        val lFont  = logoFont!!
        val laFont = labelFont!!
        val iFont  = inputFont!!
        val sFont  = smallFont!!
        val bFont  = buttonFont!!

        // ── Pass 1: filled shapes ─────────────────────────────────────────────
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.1f, 0.08f, 0.15f, 1f) // Tanki dark background
        sr.rect(0f, 0f, Gdx.graphics.width.toFloat(), Gdx.graphics.height.toFloat())
        
        // Tanki orange header
        sr.color = Color(0.95f, 0.55f, 0.0f, 1f)
        sr.rect(0f, Gdx.graphics.height - 80f, Gdx.graphics.width.toFloat(), 4f)
        sr.color = Color(0.15f, 0.12f, 0.2f, 1f)
        sr.rect(0f, Gdx.graphics.height - 80f, Gdx.graphics.width.toFloat(), 80f)
        sr.end()
        
        // Draw title using SimpleTextRenderer
        // Title и subtitle
        batch.begin()
        SimpleTextRenderer.drawText(batch, "TANKI", Gdx.graphics.width / 2f - 40f, Gdx.graphics.height - 30f, 24f, Color(0.95f, 0.55f, 0.0f, 1f))
        SimpleTextRenderer.drawText(batch, "CLIENT", Gdx.graphics.width / 2f - 40f, Gdx.graphics.height - 50f, 16f, Color.WHITE)
        SimpleTextRenderer.drawText(batch, "ВХОД", Gdx.graphics.width / 2f - 20f, Gdx.graphics.height - 70f, 12f, Color(0.7f, 0.7f, 0.7f, 1f))
        batch.end()
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = TankiStyle.ORANGE_DARK;          sr.rect(panelX, 0f, panelW, 3f)
        sr.color = TankiStyle.SEPARATOR;            sr.rect(panelX + 20f, h - 82f, panelW - 40f, 1f)
        lf.drawBackground(sr); pf.drawBackground(sr)
        playButton?.drawFill(sr); guestButton?.drawFill(sr); registerButton?.drawFill(sr)
        sr.end()

        // ── Pass 2: borders ───────────────────────────────────────────────────
        sr.begin(ShapeRenderer.ShapeType.Line)
        lf.drawBorder(sr, activeField == "login")
        pf.drawBorder(sr, activeField == "password")
        playButton?.drawBorder(sr); guestButton?.drawBorder(sr); registerButton?.drawBorder(sr)
        sr.end()

        // ── Pass 3: text ──────────────────────────────────────────────────────
        batch.begin()
        lFont.color = TankiStyle.ORANGE
        val ll = GlyphLayout(lFont, "TANKI")
        lFont.draw(batch, "TANKI", panelX + (panelW - ll.width) / 2f, h - 20f)
        sFont.color = TankiStyle.TEXT_GRAY
        val sl = GlyphLayout(sFont, "ONLINE")
        sFont.draw(batch, "ONLINE", panelX + (panelW - sl.width) / 2f, h - 68f)
        laFont.color = TankiStyle.TEXT_GRAY
        laFont.draw(batch, "Логин",  lf.x, lf.y + lf.height + 18f)
        laFont.draw(batch, "Пароль", pf.x, pf.y + pf.height + 18f)
        lf.drawText(batch, iFont, login)
        pf.drawText(batch, iFont, password)
        playButton?.drawText(batch, bFont)
        guestButton?.drawText(batch, bFont)
        registerButton?.drawText(batch, bFont)
        val msg = when {
            isLoggingIn               -> "Подключение..."
            errorMessage.isNotEmpty() -> errorMessage
            else                      -> ""
        }
        if (msg.isNotEmpty()) {
            sFont.color = if (isLoggingIn) TankiStyle.TEXT_GRAY else Color(1f, 0.3f, 0.2f, 1f)
            val el = GlyphLayout(sFont, msg)
            sFont.draw(batch, msg, panelX + (panelW - el.width) / 2f, pf.y - 8f)
        }
        batch.end()
    }

    private fun attemptLogin() {
        if (isLoggingIn) return
        val l = login.trim(); val p = password.trim()
        if (l.isEmpty() || p.isEmpty()) { errorMessage = "Введите логин и пароль"; return }
        isLoggingIn = true; errorMessage = ""
        
        // Подключаемся к серверу и пытаемся войти
        logger.info("Попытка подключения к серверу с логином: $l")
        networkManager.login(l, p)
    }

    private fun guestLogin() {
        // Create a guest user with random tank
        logger.info("Attempting guest login...")
        val guestName = "Guest${(1000..9999).random()}"
        println("DEBUG: Creating guest user: $guestName")
        val success = userModel.login(guestName, "guest")
        logger.info("Guest login result: $success")
        
        if (success) {
            val user = userModel.getCurrentUser()
            val tank = userModel.getCurrentTank()
            val tankSpec = userModel.getCurrentTankSpec()
            println("DEBUG: Guest user created - User: ${user?.username}, Tank: ${tank?.name}, TankSpec: $tankSpec")
            logger.info("Guest user created - User: ${user?.username}, Tank: ${tank?.name}")
            uiManager.showScreen(ScreenType.MAIN_MENU)
        } else {
            println("DEBUG: Failed to create guest user")
            logger.error("Failed to create guest user")
        }
    }

    override fun dispose() {
        logoFont?.dispose()
        labelFont?.dispose()
        inputFont?.dispose()
        smallFont?.dispose()
        buttonFont?.dispose()
    }
}
