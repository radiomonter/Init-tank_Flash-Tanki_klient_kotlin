package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class BattleScreen : UIScreen(), KoinComponent {

    private val uiManager: UIManager by inject()
    private var font: BitmapFont? = null
    private var buttonFont: BitmapFont? = null
    private var leaveButton: Button? = null
    private var uiBuilt = false

    private fun ensureUI() {
        if (uiBuilt) return; uiBuilt = true
        font       = makeFont(15)
        buttonFont = makeFont(17)
        leaveButton = Button(20f, 20f, 140f, 50f, "ВЫЙТИ", { uiManager.showScreen(ScreenType.LOBBY) })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureUI()
        val w = Gdx.graphics.width.toFloat(); val h = Gdx.graphics.height.toFloat()
        val f = font!!; val bf = buttonFont!!

        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.15f, 0.22f, 0.08f, 1f); sr.rect(0f, 0f, w, h)
        leaveButton?.drawFill(sr)
        sr.end()
        sr.begin(ShapeRenderer.ShapeType.Line)
        leaveButton?.drawBorder(sr)
        sr.end()

        batch.begin()
        f.color = Color.WHITE
        f.draw(batch, "HP: 100%", 50f, h - 50f)
        f.draw(batch, "Счёт: 0",  w - 180f, h - 50f)
        f.color = TankiStyle.ORANGE
        f.draw(batch, "БОЙ", w / 2f - 40f, h / 2f)
        leaveButton?.drawText(batch, bf)
        batch.end()

        if (Gdx.input.justTouched()) {
            val x = Gdx.input.x.toFloat(); val y = Gdx.graphics.height - Gdx.input.y.toFloat()
            leaveButton?.checkClick(x, y)
        }
    }

    override fun dispose() { /* Шрифты управляются FontGenerator */ }
}
