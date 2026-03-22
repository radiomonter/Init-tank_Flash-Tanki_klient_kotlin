package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.network.NetworkManager
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class LobbyScreen : UIScreen(), KoinComponent {

    private val uiManager: UIManager by inject()
    private val networkManager: NetworkManager by inject()

    private var font: BitmapFont? = null
    private var smallFont: BitmapFont? = null
    private var buttonFont: BitmapFont? = null
    private var backButton: Button? = null
    private var uiBuilt = false

    private val battles = mutableListOf<NetworkManager.BattleInfo>()
    private var scrollOffset = 0f

    override fun show() {
        super.show()
        networkManager.onBattleList = { list ->
            Gdx.app.postRunnable {
                battles.clear()
                battles.addAll(list)
            }
        }
    }

    private fun ensureUI() {
        if (uiBuilt) return; uiBuilt = true
        font       = makeFont(16)
        smallFont  = makeFont(13)
        buttonFont = makeFont(17)
        backButton = Button(20f, 20f, 120f, 46f, "НАЗАД", { uiManager.showScreen(ScreenType.MAIN_MENU) })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureUI()
        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        val f = font!!; val sf = smallFont!!; val bf = buttonFont!!

        // ── Background ────────────────────────────────────────────────────────
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.05f, 0.05f, 0.15f, 1f); sr.rect(0f, 0f, w, h)
        sr.color = TankiStyle.ORANGE;               sr.rect(0f, h - 4f, w, 4f)
        backButton?.drawFill(sr)

        // ── Battle rows ───────────────────────────────────────────────────────
        val rowH = 52f; val listTop = h - 80f; val listX = 20f; val listW = w - 40f
        battles.forEachIndexed { i, b ->
            val ry = listTop - i * (rowH + 6f) + scrollOffset
            if (ry + rowH < 80f || ry > h) return@forEachIndexed
            sr.color = Color(0.10f, 0.12f, 0.20f, 1f); sr.rect(listX, ry, listW, rowH)
        }
        sr.end()

        sr.begin(ShapeRenderer.ShapeType.Line)
        backButton?.drawBorder(sr)
        battles.forEachIndexed { i, _ ->
            val ry = listTop - i * (rowH + 6f) + scrollOffset
            if (ry + rowH < 80f || ry > h) return@forEachIndexed
            sr.color = TankiStyle.SEPARATOR; sr.rect(listX, ry, listW, rowH)
        }
        sr.end()

        // ── Text ──────────────────────────────────────────────────────────────
        batch.begin()
        f.color = TankiStyle.ORANGE
        val title = "СПИСОК БОЁВ"
        val tl = GlyphLayout(f, title)
        f.draw(batch, title, (w - tl.width) / 2f, h - 20f)

        if (battles.isEmpty()) {
            sf.color = TankiStyle.TEXT_GRAY
            val msg = "Загрузка списка боёв..."
            val ml = GlyphLayout(sf, msg)
            sf.draw(batch, msg, (w - ml.width) / 2f, h / 2f)
        } else {
            battles.forEachIndexed { i, b ->
                val ry = listTop - i * (rowH + 6f) + scrollOffset
                if (ry + rowH < 80f || ry > h) return@forEachIndexed
                f.color = Color.WHITE
                f.draw(batch, b.name, listX + 10f, ry + rowH - 10f)
                sf.color = TankiStyle.TEXT_GRAY
                sf.draw(batch, "${b.mode}  •  ${b.map}  •  ${b.users}/${b.maxPeople}  •  ранг ${b.minRank}-${b.maxRank}",
                    listX + 10f, ry + 18f)
            }
        }

        backButton?.drawText(batch, bf)
        batch.end()

        // ── Input ─────────────────────────────────────────────────────────────
        if (Gdx.input.justTouched()) {
            val x = Gdx.input.x.toFloat(); val y = h - Gdx.input.y.toFloat()
            backButton?.checkClick(x, y)

            // Click on battle row → go to battle
            battles.forEachIndexed { i, _ ->
                val ry = listTop - i * (rowH + 6f) + scrollOffset
                if (x in listX..(listX + listW) && y in ry..(ry + rowH)) {
                    uiManager.showScreen(ScreenType.BATTLE)
                }
            }
        }
    }

    override fun dispose() { font?.dispose(); smallFont?.dispose(); buttonFont?.dispose() }
}
