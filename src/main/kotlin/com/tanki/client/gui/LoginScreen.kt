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

    private var titleFont:  BitmapFont? = null
    private var labelFont:  BitmapFont? = null
    private var inputFont:  BitmapFont? = null
    private var smallFont:  BitmapFont? = null
    private var buttonFont: BitmapFont? = null

    private var loginField:    TextField? = null
    private var passwordField: TextField? = null
    private var playButton:    Button? = null

    private var activeField  = ""
    private var login        = ""
    private var password     = ""
    private var errorMessage = ""
    private var isLoggingIn  = false

    // Цвета из CSS
    private val NEON        = Color(0.0f,  1.0f,  0.6f,  1.0f)  // #00ff99
    private val NEON_GLOW   = Color(0.0f,  1.0f,  0.6f,  0.4f)  // #00ff9966
    private val NEON_DIM    = Color(0.0f,  0.7f,  0.42f, 1.0f)
    private val CARD_BG     = Color(0.078f,0.078f,0.078f,0.92f)  // rgba(20,20,20,0.85)
    private val FIELD_BG    = Color(0.067f,0.067f,0.067f,1.0f)   // #111
    private val BTN_COLOR   = Color(0.0f,  1.0f,  0.6f,  1.0f)  // #00ff99
    private val BTN_TEXT    = Color(0.0f,  0.0f,  0.0f,  1.0f)  // #000

    // Размеры (из CSS: width:380px, padding:40px)
    private val CARD_W  = 380f
    private val PAD     = 40f
    private val FIELD_H = 46f
    private val BTN_H   = 50f
    private val GAP     = 20f

    private var cardX = 0f; private var cardY = 0f; private var cardH = 0f
    private var linkY = 0f
    private var fontsBuilt = false

    private val inputProcessor = object : InputAdapter() {
        override fun keyTyped(character: Char): Boolean {
            if (activeField.isEmpty()) return false
            when (character) {
                '\b' -> {
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
                // Ссылка "Создать аккаунт"
                if (my in linkY..(linkY + 22f) && mx in cardX..(cardX + CARD_W)) {
                    uiManager.showScreen(ScreenType.REGISTER)
                }
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

    override fun resize(width: Int, height: Int) {
        rebuildLayout(width.toFloat(), height.toFloat())
    }

    private fun ensureFonts() {
        if (fontsBuilt) return; fontsBuilt = true
        titleFont  = makeFont(22)
        labelFont  = makeFont(13)
        inputFont  = makeFont(15)
        smallFont  = makeFont(14)
        buttonFont = makeFont(17)
    }

    private fun rebuildLayout(w: Float, h: Float) {
        val fw = CARD_W - PAD * 2
        // Высота карточки: pad + title(36) + gap + label+field + gap + label+field + gap + btn + gap + link + pad
        cardH = PAD + 36f + GAP + 16f + FIELD_H + GAP + 16f + FIELD_H + GAP + BTN_H + GAP + 20f + PAD
        cardX = (w - CARD_W) / 2f
        cardY = (h - cardH) / 2f

        var y = cardY + cardH - PAD - 36f - GAP  // под заголовком

        // Поле логина: label 16px выше поля
        y -= 16f + FIELD_H
        loginField = TextField(cardX + PAD, y, fw, FIELD_H, "")

        // Поле пароля
        y -= GAP + 16f + FIELD_H
        passwordField = TextField(cardX + PAD, y, fw, FIELD_H, "", isPassword = true)

        // Кнопка
        y -= GAP + BTN_H
        playButton = Button(cardX + PAD, y, fw, BTN_H, "Войти", { attemptLogin() }, style = ButtonStyle.GREEN)

        // Ссылка
        linkY = y - GAP - 20f
    }

    private fun setupNetworkCallbacks() {
        networkManager.onLoginSuccess = { _ ->
            Gdx.app.postRunnable { isLoggingIn = false; errorMessage = ""; uiManager.showScreen(ScreenType.MAIN_MENU) }
        }
        networkManager.onLoginFailed = { reason ->
            Gdx.app.postRunnable { isLoggingIn = false; errorMessage = reason }
        }
        networkManager.onCommand = { category, name, args ->
            if (name == "initpanel" && category == "lobby") {
                val uname     = extractJson(args, "name")                       ?: login.trim()
                val rank      = extractJson(args, "rang")?.toIntOrNull()        ?: 1
                val crystals  = extractJson(args, "crystall")?.toIntOrNull()    ?: 0
                val score     = extractJson(args, "score")?.toLongOrNull()      ?: 0L
                val nextScore = extractJson(args, "next_score")?.toLongOrNull() ?: 1000L
                val premium   = extractJson(args, "hasDoubleCrystal") == "true"
                userModel.setFromServer(uname, rank, crystals, score, nextScore, premium)
            }
        }
    }

    private fun extractJson(json: String, key: String): String? =
        Regex(""""$key"\s*:\s*"?([^",}\]]+)"?""").find(json)?.groupValues?.get(1)?.trim()

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureFonts()
        if (loginField == null) rebuildLayout(Gdx.graphics.width.toFloat(), Gdx.graphics.height.toFloat())

        val w  = Gdx.graphics.width.toFloat()
        val h  = Gdx.graphics.height.toFloat()
        val lf = loginField!!; val pf = passwordField!!
        val fw = CARD_W - PAD * 2

        // ── PASS 1: ShapeRenderer ─────────────────────────────────────────────
        sr.begin(ShapeRenderer.ShapeType.Filled)

        // Фон страницы
        sr.color = Color(0.05f, 0.06f, 0.08f, 1f); sr.rect(0f, 0f, w, h)

        // Свечение карточки — тонкое, 3 слоя
        for (i in 3 downTo 1) {
            val e = i * 4f
            sr.color = Color(NEON_GLOW.r, NEON_GLOW.g, NEON_GLOW.b, 0.06f * (4 - i))
            sr.rect(cardX - e, cardY - e, CARD_W + e * 2, cardH + e * 2)
        }

        // Карточка background: rgba(20,20,20,0.85) — с закруглёнными углами
        sr.color = CARD_BG
        com.tanki.client.utils.ShapeUtils.filledRoundRect(sr, cardX, cardY, CARD_W, cardH, 10f)

        // Фон полей #111
        sr.color = FIELD_BG; sr.rect(lf.x, lf.y, lf.width, lf.height)
        sr.color = FIELD_BG; sr.rect(pf.x, pf.y, pf.width, pf.height)

        // Кнопка — зелёный фон
        sr.color = BTN_COLOR
        playButton?.let { sr.rect(it.x, it.y, it.width, it.height) }

        // Блок ошибки (если есть)
        if (errorMessage.isNotEmpty() && !isLoggingIn) {
            sr.color = Color(1f, 0.2f, 0.2f, 0.9f)
            sr.rect(cardX + PAD, pf.y - GAP - 32f, fw, 32f)
        }

        sr.end()

        // Рамки — border: 2px solid #00ff99, border-radius: 10px
        sr.begin(ShapeRenderer.ShapeType.Line)
        sr.color = NEON
        com.tanki.client.utils.ShapeUtils.lineRoundRect(sr, cardX, cardY, CARD_W, cardH, 10f)
        lf.drawBorder(sr, activeField == "login",    NEON, NEON_DIM)
        pf.drawBorder(sr, activeField == "password", NEON, NEON_DIM)
        sr.end()

        // ── PASS 2: SpriteBatch ───────────────────────────────────────────────
        batch.begin()

        // Заголовок — color:#00ff99, text-shadow
        val tf = titleFont!!
        tf.color = NEON
        val title = "Вход в INIT TANK"
        val tl = GlyphLayout(tf, title)
        tf.draw(batch, title, cardX + (CARD_W - tl.width) / 2f,
            cardY + cardH - PAD - 4f)

        // Метки полей — color:#ccc
        val lf2 = labelFont!!
        lf2.color = Color(0.8f, 0.8f, 0.8f, 1f)
        lf2.draw(batch, "Логин",  lf.x, lf.y + lf.height + 14f)
        lf2.draw(batch, "Пароль", pf.x, pf.y + pf.height + 14f)

        // Текст в полях — color:#00ff99
        val inf = inputFont!!
        if (login.isEmpty()) {
            inf.color = NEON_DIM
        } else {
            inf.color = NEON
        }
        lf.drawText(batch, inf, login)

        if (password.isEmpty()) {
            inf.color = NEON_DIM
        } else {
            inf.color = NEON
        }
        pf.drawText(batch, inf, password)

        // Кнопка — чёрный текст на зелёном
        val bf = buttonFont!!
        bf.color = BTN_TEXT
        playButton?.let { btn ->
            val bl = GlyphLayout(bf, btn.text)
            bf.draw(batch, btn.text, btn.x + (btn.width - bl.width) / 2f,
                btn.y + (btn.height + bl.height) / 2f)
        }

        // Ошибка / статус
        val sf = smallFont!!
        val msg = when {
            isLoggingIn               -> "Подключение..."
            errorMessage.isNotEmpty() -> errorMessage
            else                      -> ""
        }
        if (msg.isNotEmpty()) {
            sf.color = if (isLoggingIn) Color(0.6f, 0.6f, 0.6f, 1f) else Color.WHITE
            val el = GlyphLayout(sf, msg)
            sf.draw(batch, msg, cardX + (CARD_W - el.width) / 2f,
                pf.y - GAP - 8f)
        }

        // Ссылка "Создать аккаунт" — color:#00ff99
        sf.color = NEON
        val linkText = "Создать аккаунт"
        val ll = GlyphLayout(sf, linkText)
        sf.draw(batch, linkText, cardX + (CARD_W - ll.width) / 2f, linkY + 16f)

        batch.end()
    }

    private fun attemptLogin() {
        if (isLoggingIn) return
        val l = login.trim(); val p = password.trim()
        if (l.isEmpty() || p.isEmpty()) { errorMessage = "Введите логин и пароль"; return }
        isLoggingIn = true; errorMessage = ""
        networkManager.login(l, p)
    }

    override fun dispose() { /* Шрифты управляются FontGenerator */ }
}
