package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class GarageScreen : UIScreen(), KoinComponent {

    private val uiManager: UIManager by inject()
    private val userModel: UserModel by inject()
    private var font: BitmapFont? = null
    private var buttonFont: BitmapFont? = null
    private var backButton: Button? = null
    private var uiBuilt = false

    private fun ensureUI() {
        if (uiBuilt) return; uiBuilt = true
        font       = makeFont(15)
        buttonFont = makeFont(17)
        backButton = Button(20f, 20f, 120f, 50f, "НАЗАД", { uiManager.showScreen(ScreenType.MAIN_MENU) })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureUI()
        val w = Gdx.graphics.width.toFloat(); val h = Gdx.graphics.height.toFloat()
        val f = font!!; val bf = buttonFont!!

        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.08f, 0.05f, 0.05f, 1f); sr.rect(0f, 0f, w, h)
        backButton?.drawFill(sr)
        sr.end()
        sr.begin(ShapeRenderer.ShapeType.Line)
        backButton?.drawBorder(sr)
        sr.end()

        batch.begin()
        f.color = TankiStyle.ORANGE
        f.draw(batch, "ГАРАЖ", 50f, h - 50f)
        f.color = TankiStyle.TEXT_GRAY
        f.draw(batch, "Выбор танка — в разработке", 50f, h - 150f)
        val user = userModel.getCurrentUser()
        if (user != null) { f.color = TankiStyle.ORANGE; f.draw(batch, "Кристаллы: ${user.crystals}", w - 220f, h - 50f) }
        backButton?.drawText(batch, bf)
        batch.end()

        if (Gdx.input.justTouched()) {
            val x = Gdx.input.x.toFloat(); val y = Gdx.graphics.height - Gdx.input.y.toFloat()
            backButton?.checkClick(x, y)
        }
    }

    override fun dispose() { font?.dispose(); buttonFont?.dispose() }
}
