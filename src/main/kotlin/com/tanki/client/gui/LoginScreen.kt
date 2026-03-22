package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.InputAdapter
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.network.NetworkManager
import com.tanki.client.utils.makeFont
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
                isLoggingIn = false
                errorMessage = ""
                uiManager.showScreen(ScreenType.MAIN_MENU)
            }
        }
        networkManager.onLoginFailed = { reason ->
            Gdx.app.postRunnable {
                isLoggingIn = false
                errorMessage = reason
            }
        }
        networkManager.onCommand = { category, name, args ->
            if (name == "initpanel" && category == "lobby") {
                // Parse user data from server and store in UserModel
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
        sr.color = Color(0.06f, 0.08f, 0.10f, 1f); sr.rect(0f, 0f, panelX, h)
        sr.color = Color(0.09f, 0.12f, 0.14f, 1f)
        var gx = 0f; while (gx < panelX) { sr.rect(gx, 0f, 1f, h); gx += 48f }
        var gy = 0f; while (gy < h)      { sr.rect(0f, gy, panelX, 1f); gy += 48f }
        val tx = panelX / 2f; val ty = h / 2f
        sr.color = Color(0.14f, 0.18f, 0.12f, 1f)
        sr.rect(tx - 60f, ty - 20f, 120f, 40f)
        sr.rect(tx - 30f, ty + 18f, 60f, 28f)
        sr.rect(tx - 10f, ty + 42f, 20f, 50f)
        sr.color = Color(0.10f, 0.13f, 0.09f, 1f)
        sr.rect(tx - 70f, ty - 30f, 140f, 12f)
        sr.rect(tx - 70f, ty + 8f,  140f, 12f)
        sr.color = TankiStyle.ORANGE;               sr.rect(panelX - 3f, 0f, 3f, h)
        sr.color = Color(0.10f, 0.12f, 0.16f, 1f); sr.rect(panelX, 0f, panelW, h)
        sr.color = TankiStyle.ORANGE;               sr.rect(panelX, h - 4f, panelW, 4f)
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
        networkManager.login(l, p)
    }

    private fun guestLogin() = uiManager.showScreen(ScreenType.MAIN_MENU)

    override fun dispose() {
        logoFont?.dispose()
        labelFont?.dispose()
        inputFont?.dispose()
        smallFont?.dispose()
        buttonFont?.dispose()
    }
}
