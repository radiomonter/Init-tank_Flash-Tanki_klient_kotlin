package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class MainMenuScreen : UIScreen(), KoinComponent {

    private val uiManager: UIManager by inject()
    private val userModel: UserModel by inject()

    private var titleFont:  BitmapFont? = null
    private var subFont:    BitmapFont? = null
    private var buttonFont: BitmapFont? = null

    private var garageButton: Button? = null
    private var battleButton: Button? = null
    private var exitButton:   Button? = null

    private var uiBuilt = false

    private fun ensureUI() {
        if (uiBuilt) return
        uiBuilt = true
        titleFont  = makeFont(40)
        subFont    = makeFont(16)
        buttonFont = makeFont(17)
        val cx = Gdx.graphics.width / 2f
        val cy = Gdx.graphics.height / 2f
        val bw = 260f; val bh = 52f; val gap = 18f
        garageButton = Button(cx - bw / 2f, cy + gap + bh,  bw, bh, "ГАРАЖ", { uiManager.showScreen(ScreenType.GARAGE) }, style = ButtonStyle.ACCENT)
        battleButton = Button(cx - bw / 2f, cy,              bw, bh, "В БОЙ", { uiManager.showScreen(ScreenType.LOBBY) },  style = ButtonStyle.GREEN)
        exitButton   = Button(cx - bw / 2f, cy - gap - bh,  bw, bh, "ВЫХОД", { Gdx.app.exit() })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureUI()
        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        val tFont = titleFont!!; val sFont = subFont!!; val bFont = buttonFont!!

        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.05f, 0.07f, 0.10f, 1f); sr.rect(0f, 0f, w, h)
        sr.color = TankiStyle.ORANGE;               sr.rect(0f, h - 4f, w, 4f)
        garageButton?.drawFill(sr); battleButton?.drawFill(sr); exitButton?.drawFill(sr)
        sr.end()

        sr.begin(ShapeRenderer.ShapeType.Line)
        garageButton?.drawBorder(sr); battleButton?.drawBorder(sr); exitButton?.drawBorder(sr)
        sr.end()

        batch.begin()
        tFont.color = TankiStyle.ORANGE
        val tl = GlyphLayout(tFont, "TANKI ONLINE")
        tFont.draw(batch, "TANKI ONLINE", (w - tl.width) / 2f, h - 40f)
        val user = userModel.getCurrentUser()
        if (user != null) {
            sFont.color = TankiStyle.TEXT_GRAY
            val ul = GlyphLayout(sFont, "Привет, ${user.username}!")
            sFont.draw(batch, "Привет, ${user.username}!", (w - ul.width) / 2f, h - 100f)
        }
        garageButton?.drawText(batch, bFont)
        battleButton?.drawText(batch, bFont)
        exitButton?.drawText(batch, bFont)
        batch.end()

        if (Gdx.input.justTouched()) {
            val x = Gdx.input.x.toFloat()
            val y = Gdx.graphics.height - Gdx.input.y.toFloat()
            garageButton?.checkClick(x, y); battleButton?.checkClick(x, y); exitButton?.checkClick(x, y)
        }
    }

    override fun dispose() {
        titleFont?.dispose(); subFont?.dispose(); buttonFont?.dispose()
    }
}
