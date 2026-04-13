package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.utils.ShapeUtils
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class RegisterScreen : UIScreen(), KoinComponent {

    private val logger = LoggerFactory.getLogger(RegisterScreen::class.java)
    private val uiManager: UIManager by inject()

    private var titleFont:  BitmapFont? = null
    private var labelFont:  BitmapFont? = null
    private var inputFont:  BitmapFont? = null
    private var smallFont:  BitmapFont? = null
    private var buttonFont: BitmapFont? = null

    private var usernameField:        TextField? = null
    private var passwordField:        TextField? = null
    private var confirmPasswordField: TextField? = null

    private var activeField     = ""
    private var username        = ""
    private var password        = ""
    private var confirmPassword = ""
    private var errorMessage    = ""

    private var registerButton: Button? = null

    // Цвета из CSS
    private val GREEN      = Color(0.549f, 1.0f,   0.302f, 1.0f)  // #8cff4d
    private val GREEN_DIM  = Color(0.310f, 0.659f, 0.169f, 1.0f)  // #4fa82b
    private val GREEN_GLW  = Color(0.549f, 1.0f,   0.302f, 0.15f) // rgba(0,255,0,0.15)
    private val BORDER_CLR = Color(0.180f, 0.196f, 0.220f, 1.0f)  // #2e3238
    private val CARD_BG    = Color(0.078f, 0.086f, 0.098f, 0.92f) // rgba(20,22,25,0.9)
    private val FIELD_BG   = Color(0.102f, 0.110f, 0.122f, 1.0f)  // #1a1c1f
    private val BTN_TEXT   = Color(0.051f, 0.059f, 0.071f, 1.0f)  // #0d0f12
    private val LABEL_CLR  = Color(0.780f, 0.780f, 0.780f, 1.0f)  // #c7c7c7
    private val LINK_CLR   = Color(0.600f, 0.600f, 0.600f, 1.0f)  // серый текст

    // Размеры
    private val CARD_W = 380f
    private val PAD    = 30f
    private val FIELD_H = 48f
    private val BTN_H   = 50f
    private val GAP     = 18f

    private var cardX = 0f; private var cardY = 0f; private var cardH = 0f
    private var linkY = 0f
    private var fontsBuilt = false

    private val inputProcessor = object : com.badlogic.gdx.InputAdapter() {
        override fun keyTyped(character: Char): Boolean {
            if (activeField.isEmpty()) return false
            when (character) {
                '\b' -> when (activeField) {
                    "username" -> if (username.isNotEmpty())        username = username.dropLast(1)
                    "password" -> if (password.isNotEmpty())        password = password.dropLast(1)
                    "confirm"  -> if (confirmPassword.isNotEmpty()) confirmPassword = confirmPassword.dropLast(1)
                }
                '\r', '\n' -> handleRegister()
                '\t' -> activeField = when (activeField) {
                    "username" -> "password"; "password" -> "confirm"; else -> "username"
                }
                else -> if (character.code >= 32) when (activeField) {
                    "username" -> username        += character
                    "password" -> password        += character
                    "confirm"  -> confirmPassword += character
                }
            }
            return true
        }

        override fun touchDown(screenX: Int, screenY: Int, pointer: Int, button: Int): Boolean {
            val mx = screenX.toFloat()
            val my = Gdx.graphics.height - screenY.toFloat()
            activeField = when {
                usernameField?.contains(mx, my) == true        -> "username"
                passwordField?.contains(mx, my) == true        -> "password"
                confirmPasswordField?.contains(mx, my) == true -> "confirm"
                else -> ""
            }
            registerButton?.checkClick(mx, my)
            // Ссылка "Войти"
            if (my in linkY..(linkY + 22f) && mx in cardX..(cardX + CARD_W)) {
                uiManager.showScreen(ScreenType.LOGIN)
            }
            return true
        }
    }

    override fun show() {
        super.show()
        Gdx.input.inputProcessor = inputProcessor
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
        titleFont  = makeFont(24)
        labelFont  = makeFont(13)
        inputFont  = makeFont(15)
        smallFont  = makeFont(14)
        buttonFont = makeFont(15)
    }

    private fun rebuildLayout(w: Float, h: Float) {
        val fw = CARD_W - PAD * 2
        // Высота: pad + title(40) + gap + (label+field)*3 + gap*2 + btn + gap + link + pad
        cardH = PAD + 40f + GAP + (16f + FIELD_H + GAP) * 3 + BTN_H + GAP + 20f + PAD
        cardX = (w - CARD_W) / 2f
        cardY = (h - cardH) / 2f

        var y = cardY + cardH - PAD - 40f - GAP

        y -= 16f + FIELD_H
        usernameField = TextField(cardX + PAD, y, fw, FIELD_H, "")

        y -= GAP + 16f + FIELD_H
        passwordField = TextField(cardX + PAD, y, fw, FIELD_H, "", isPassword = true)

        y -= GAP + 16f + FIELD_H
        confirmPasswordField = TextField(cardX + PAD, y, fw, FIELD_H, "", isPassword = true)

        y -= GAP + BTN_H
        registerButton = Button(cardX + PAD, y, fw, BTN_H, "СОЗДАТЬ АККАУНТ", { handleRegister() }, style = ButtonStyle.GREEN)

        linkY = y - GAP - 20f
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureFonts()
        if (usernameField == null) rebuildLayout(Gdx.graphics.width.toFloat(), Gdx.graphics.height.toFloat())

        val w  = Gdx.graphics.width.toFloat()
        val h  = Gdx.graphics.height.toFloat()
        val uf = usernameField!!; val pf = passwordField!!; val cf = confirmPasswordField!!
        val fw = CARD_W - PAD * 2

        // ── PASS 1: Filled ────────────────────────────────────────────────────
        sr.begin(ShapeRenderer.ShapeType.Filled)

        // Фон страницы #0d0f12
        sr.color = Color(0.051f, 0.059f, 0.071f, 1f); sr.rect(0f, 0f, w, h)

        // Слабое зелёное свечение — box-shadow: 0 0 25px rgba(0,255,0,0.15)
        for (i in 4 downTo 1) {
            val e = i * 5f
            sr.color = Color(GREEN_GLW.r, GREEN_GLW.g, GREEN_GLW.b, 0.04f * (5 - i))
            sr.rect(cardX - e, cardY - e, CARD_W + e * 2, cardH + e * 2)
        }

        // Карточка — border-radius: 8px
        sr.color = CARD_BG
        ShapeUtils.filledRoundRect(sr, cardX, cardY, CARD_W, cardH, 8f)

        // Фон полей #1a1c1f
        sr.color = FIELD_BG
        sr.rect(uf.x, uf.y, uf.width, uf.height)
        sr.rect(pf.x, pf.y, pf.width, pf.height)
        sr.rect(cf.x, cf.y, cf.width, cf.height)

        // Кнопка — градиент имитируем двумя прямоугольниками
        sr.color = GREEN
        registerButton?.let { sr.rect(it.x, it.y + it.height / 2f, it.width, it.height / 2f) }
        sr.color = GREEN_DIM
        registerButton?.let { sr.rect(it.x, it.y, it.width, it.height / 2f) }

        sr.end()

        // ── PASS 2: Line ──────────────────────────────────────────────────────
        sr.begin(ShapeRenderer.ShapeType.Line)

        // Рамка карточки — border: 2px solid #2e3238
        sr.color = BORDER_CLR
        ShapeUtils.lineRoundRect(sr, cardX, cardY, CARD_W, cardH, 8f)

        // Рамки полей — border: 1px solid #2e3238, focus: #8cff4d
        uf.drawBorder(sr, activeField == "username", GREEN, BORDER_CLR)
        pf.drawBorder(sr, activeField == "password", GREEN, BORDER_CLR)
        cf.drawBorder(sr, activeField == "confirm",  GREEN, BORDER_CLR)

        sr.end()

        // ── PASS 3: Text ──────────────────────────────────────────────────────
        batch.begin()

        // Заголовок — color:#8cff4d, text-shadow
        val tf = titleFont!!
        tf.color = GREEN
        val title = "Регистрация"
        val tl = GlyphLayout(tf, title)
        tf.draw(batch, title, cardX + (CARD_W - tl.width) / 2f,
            cardY + cardH - PAD - 4f)

        // Метки — color:#c7c7c7
        val lf2 = labelFont!!
        lf2.color = LABEL_CLR
        lf2.draw(batch, "Логин",             uf.x, uf.y + uf.height + 14f)
        lf2.draw(batch, "Пароль",            pf.x, pf.y + pf.height + 14f)
        lf2.draw(batch, "Повторите пароль",  cf.x, cf.y + cf.height + 14f)

        // Текст полей — color:#e0e0e0
        val inf = inputFont!!
        inf.color = Color(0.878f, 0.878f, 0.878f, 1f)
        uf.drawText(batch, inf, username)
        pf.drawText(batch, inf, password)
        cf.drawText(batch, inf, confirmPassword)

        // Кнопка — чёрный текст, uppercase
        val bf = buttonFont!!
        bf.color = BTN_TEXT
        registerButton?.let { btn ->
            val bl = GlyphLayout(bf, btn.text)
            bf.draw(batch, btn.text, btn.x + (btn.width - bl.width) / 2f,
                btn.y + (btn.height + bl.height) / 2f)
        }

        // Ссылка "Уже есть аккаунт? Войти"
        val sf = smallFont!!
        sf.color = LINK_CLR
        val linkStatic = "Уже есть аккаунт? "
        val linkActive = "Войти"
        val ls = GlyphLayout(sf, linkStatic)
        val la = GlyphLayout(sf, linkActive)
        val totalW = ls.width + la.width
        val lx = cardX + (CARD_W - totalW) / 2f
        sf.draw(batch, linkStatic, lx, linkY + 16f)
        sf.color = GREEN
        sf.draw(batch, linkActive, lx + ls.width, linkY + 16f)

        // Ошибка
        if (errorMessage.isNotEmpty()) {
            sf.color = Color(1f, 0.42f, 0.42f, 1f)
            val el = GlyphLayout(sf, errorMessage)
            sf.draw(batch, errorMessage, cardX + (CARD_W - el.width) / 2f, cf.y - 8f)
        }

        batch.end()
    }

    private fun handleRegister() {
        errorMessage = ""
        when {
            username.isBlank()          -> { errorMessage = "Введите никнейм"; return }
            username.length < 3         -> { errorMessage = "Никнейм минимум 3 символа"; return }
            password.isBlank()          -> { errorMessage = "Введите пароль"; return }
            password.length < 6         -> { errorMessage = "Пароль минимум 6 символов"; return }
            password != confirmPassword -> { errorMessage = "Пароли не совпадают"; return }
        }
        // TODO: отправить регистрацию на сервер
        uiManager.showScreen(ScreenType.LOGIN)
    }

    override fun dispose() { /* Шрифты управляются FontGenerator */ }
}
