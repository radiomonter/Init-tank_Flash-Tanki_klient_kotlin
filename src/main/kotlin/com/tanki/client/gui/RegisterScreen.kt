package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.Input
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class RegisterScreen : UIScreen(), KoinComponent {

    private val logger = LoggerFactory.getLogger(RegisterScreen::class.java)
    private val uiManager: UIManager by inject()
    private val userModel: UserModel by inject()

    private var logoFont:   BitmapFont? = null
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
    private var backButton:     Button? = null

    private var panelX  = 0f
    private var panelW  = 0f
    private var uiBuilt = false

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
        val cy = h / 2f + 40f
        usernameField        = TextField(fx, cy + 10f,  fw, 42f, "Никнейм")
        passwordField        = TextField(fx, cy - 70f,  fw, 42f, "Пароль",           isPassword = true)
        confirmPasswordField = TextField(fx, cy - 150f, fw, 42f, "Повторите пароль", isPassword = true)
        registerButton = Button(fx, cy - 220f, fw, 48f, "ЗАРЕГИСТРИРОВАТЬСЯ", { handleRegister() }, style = ButtonStyle.GREEN)
        backButton     = Button(fx, cy - 280f, fw, 48f, "НАЗАД",              { uiManager.showScreen(ScreenType.LOGIN) })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureFontsAndUI()
        val h = Gdx.graphics.height.toFloat()
        val uf = usernameField!!; val pf = passwordField!!; val cf = confirmPasswordField!!
        val lFont = logoFont!!; val laFont = labelFont!!; val iFont = inputFont!!
        val sFont = smallFont!!; val bFont = buttonFont!!

        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.06f, 0.08f, 0.10f, 1f); sr.rect(0f, 0f, panelX, h)
        sr.color = Color(0.09f, 0.12f, 0.14f, 1f)
        var gx = 0f; while (gx < panelX) { sr.rect(gx, 0f, 1f, h); gx += 48f }
        var gy = 0f; while (gy < h)      { sr.rect(0f, gy, panelX, 1f); gy += 48f }
        val tx = panelX / 2f; val ty = h / 2f
        sr.color = Color(0.14f, 0.18f, 0.12f, 1f)
        sr.rect(tx - 60f, ty - 20f, 120f, 40f); sr.rect(tx - 30f, ty + 18f, 60f, 28f); sr.rect(tx - 10f, ty + 42f, 20f, 50f)
        sr.color = Color(0.10f, 0.13f, 0.09f, 1f)
        sr.rect(tx - 70f, ty - 30f, 140f, 12f); sr.rect(tx - 70f, ty + 8f, 140f, 12f)
        sr.color = TankiStyle.ORANGE;               sr.rect(panelX - 3f, 0f, 3f, h)
        sr.color = Color(0.10f, 0.12f, 0.16f, 1f); sr.rect(panelX, 0f, panelW, h)
        sr.color = TankiStyle.ORANGE;               sr.rect(panelX, h - 4f, panelW, 4f)
        sr.color = TankiStyle.ORANGE_DARK;          sr.rect(panelX, 0f, panelW, 3f)
        sr.color = TankiStyle.SEPARATOR;            sr.rect(panelX + 20f, h - 82f, panelW - 40f, 1f)
        uf.drawBackground(sr); pf.drawBackground(sr); cf.drawBackground(sr)
        registerButton?.drawFill(sr); backButton?.drawFill(sr)
        sr.end()

        sr.begin(ShapeRenderer.ShapeType.Line)
        uf.drawBorder(sr, activeField == "username")
        pf.drawBorder(sr, activeField == "password")
        cf.drawBorder(sr, activeField == "confirm")
        registerButton?.drawBorder(sr); backButton?.drawBorder(sr)
        sr.end()

        batch.begin()
        lFont.color = TankiStyle.ORANGE
        val ll = GlyphLayout(lFont, "TANKI")
        lFont.draw(batch, "TANKI", panelX + (panelW - ll.width) / 2f, h - 20f)
        sFont.color = TankiStyle.TEXT_GRAY
        val sl = GlyphLayout(sFont, "РЕГИСТРАЦИЯ")
        sFont.draw(batch, "РЕГИСТРАЦИЯ", panelX + (panelW - sl.width) / 2f, h - 68f)
        laFont.color = TankiStyle.TEXT_GRAY
        laFont.draw(batch, "Никнейм",         uf.x, uf.y + uf.height + 18f)
        laFont.draw(batch, "Пароль",           pf.x, pf.y + pf.height + 18f)
        laFont.draw(batch, "Повторите пароль", cf.x, cf.y + cf.height + 18f)
        uf.drawText(batch, iFont, username)
        pf.drawText(batch, iFont, password)
        cf.drawText(batch, iFont, confirmPassword)
        registerButton?.drawText(batch, bFont); backButton?.drawText(batch, bFont)
        if (errorMessage.isNotEmpty()) {
            sFont.color = Color(1f, 0.3f, 0.2f, 1f)
            val el = GlyphLayout(sFont, errorMessage)
            sFont.draw(batch, errorMessage, panelX + (panelW - el.width) / 2f, cf.y - 8f)
        }
        batch.end()

        handleInput()
    }

    private fun handleInput() {
        if (Gdx.input.justTouched()) {
            val mx = Gdx.input.x.toFloat()
            val my = Gdx.graphics.height - Gdx.input.y.toFloat()
            activeField = when {
                usernameField?.contains(mx, my) == true        -> "username"
                passwordField?.contains(mx, my) == true        -> "password"
                confirmPasswordField?.contains(mx, my) == true -> "confirm"
                else -> activeField
            }
            if (mx < panelX) activeField = ""
            registerButton?.checkClick(mx, my)
            backButton?.checkClick(mx, my)
        }
        if (activeField.isNotEmpty()) {
            when {
                Gdx.input.isKeyJustPressed(Input.Keys.BACKSPACE) -> when (activeField) {
                    "username" -> if (username.isNotEmpty())        username = username.dropLast(1)
                    "password" -> if (password.isNotEmpty())        password = password.dropLast(1)
                    "confirm"  -> if (confirmPassword.isNotEmpty()) confirmPassword = confirmPassword.dropLast(1)
                }
                Gdx.input.isKeyJustPressed(Input.Keys.ENTER) -> handleRegister()
                Gdx.input.isKeyJustPressed(Input.Keys.TAB)   -> activeField = when (activeField) {
                    "username" -> "password"; "password" -> "confirm"; else -> "username"
                }
            }
        }
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

    override fun dispose() {
        // Шрифты управляются FontGenerator
    }
}
