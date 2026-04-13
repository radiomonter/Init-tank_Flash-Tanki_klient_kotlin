package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.models.NewsModel
import com.tanki.client.utils.makeFont
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class MainMenuScreen : UIScreen(), KoinComponent {

    private val uiManager: UIManager by inject()
    private val userModel: UserModel by inject()
    private val newsModel: NewsModel by inject()

    private var navFont:  BitmapFont? = null
    private var infoFont: BitmapFont? = null
    private var newsFont: BitmapFont? = null
    private var logoTex:  com.badlogic.gdx.graphics.Texture? = null

    private data class NavTab(val label: String, val action: () -> Unit,
                               var x: Float = 0f, var w: Float = 0f)
    private var tabs = listOf<NavTab>()
    private var exitBtn: Button? = null
    private var uiBuilt = false

    private val NAV_H   = 44f
    private val TAB_PAD = 28f

    private fun ensureUI() {
        if (uiBuilt) return; uiBuilt = true
        navFont   = makeFont(15)
        infoFont  = makeFont(14)
        newsFont  = makeFont(14)
        logoTex   = com.badlogic.gdx.graphics.Texture(
            com.badlogic.gdx.Gdx.files.internal("init-tank-logo.png")
        ).also { it.setFilter(
            com.badlogic.gdx.graphics.Texture.TextureFilter.Linear,
            com.badlogic.gdx.graphics.Texture.TextureFilter.Linear
        ) }
        tabs = listOf(
            NavTab("ГАРАЖ", { uiManager.showScreen(ScreenType.GARAGE) }),
            NavTab("В БОЙ", { uiManager.showScreen(ScreenType.LOBBY)  })
        )
        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        exitBtn = Button(w - 90f, h - NAV_H + (NAV_H - 30f) / 2f, 80f, 30f, "ВЫХОД", { Gdx.app.exit() })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureUI()

        val w   = Gdx.graphics.width.toFloat()
        val h   = Gdx.graphics.height.toFloat()
        val nf  = navFont!!
        val inf = infoFont!!; val nwf = newsFont!!
        val navY = h - NAV_H
        val user = userModel.getCurrentUser()
        val news = newsModel.getLatest()

        // ── Вычисляем вкладки (справа, перед кнопкой ВЫХОД) ─────────────────
        val exitBtnW = 90f
        var tabX = w - exitBtnW - 10f
        tabs.asReversed().forEach { tab ->
            val gl = GlyphLayout(nf, tab.label)
            tab.w = gl.width + TAB_PAD * 2
            tabX -= tab.w
            tab.x = tabX
        }

        // ── Панель игрока (размеры) ───────────────────────────────────────────
        val panelW   = 260f
        val panelX   = 10f  // от левого края
        val py       = navY + 4f
        val rankSize = NAV_H - 8f
        val barX     = panelX + rankSize + 8f
        val barW     = panelW - rankSize - 8f
        val barH     = 6f
        val barY     = py + 8f
        val crystalX = barX + barW - 70f
        val progress = if (user != null) {
            val total = user.experience + user.nextScore
            if (total > 0) (user.experience.toFloat() / total).coerceIn(0f, 1f) else 0f
        } else 0f

        // ── Новость (размеры) ─────────────────────────────────────────────────
        val newsLines = mutableListOf<String>()
        var newsBlockH = 0f
        val newsBlockY = 50f
        val nx = 40f; val nw = w - 80f
        if (news != null) {
            val maxChars = (nw / 7.5f).toInt()
            val words = news.text.split(Regex("[ \n]+"))
            var cur = ""
            for (word in words) {
                val test = if (cur.isEmpty()) word else "$cur $word"
                if (test.length > maxChars) { if (cur.isNotEmpty()) newsLines += cur; cur = word }
                else cur = test
            }
            if (cur.isNotEmpty()) newsLines += cur
            newsBlockH = 28f + newsLines.size * 18f + 12f
        }

        // ══ PASS 1: ShapeRenderer ═════════════════════════════════════════════
        sr.begin(ShapeRenderer.ShapeType.Filled)

        // Фон
        sr.color = Color(0.05f, 0.07f, 0.10f, 1f); sr.rect(0f, 0f, w, h)

        // Навбар
        sr.color = Color(0.08f, 0.10f, 0.14f, 1f); sr.rect(0f, navY, w, NAV_H)
        sr.color = TankiStyle.ORANGE;               sr.rect(0f, navY - 2f, w, 2f)
        tabs.forEach { tab ->
            sr.color = Color(0.12f, 0.15f, 0.20f, 1f); sr.rect(tab.x, navY, tab.w, NAV_H)
            sr.color = Color(0.20f, 0.24f, 0.30f, 1f); sr.rect(tab.x + tab.w - 1f, navY, 1f, NAV_H)
        }
        exitBtn?.drawFill(sr)

        // Панель игрока
        if (user != null) {
            sr.color = Color(0f, 0f, 0f, 0.3f)
            sr.rect(panelX + 2f, py + 2f, rankSize - 4f, rankSize - 4f)
            sr.color = Color(0.15f, 0.18f, 0.22f, 1f); sr.rect(barX, barY, barW, barH)
            sr.color = TankiStyle.ORANGE;               sr.rect(barX, barY, barW * progress, barH)
            sr.color = Color(1f, 1f, 1f, 0.15f);       sr.rect(barX, barY + barH / 2f, barW * progress, barH / 2f)
            // Кристалл (ромб)
            val cx = crystalX + 5f; val cy = py + barH + 14f + 5f; val cr = 5f
            sr.color = Color(0.2f, 0.6f, 1.0f, 1f)
            sr.triangle(cx, cy + cr, cx - cr, cy, cx + cr, cy)
            sr.triangle(cx, cy - cr, cx - cr, cy, cx + cr, cy)
        }

        // Новость
        if (news != null) {
            sr.color = Color(0.08f, 0.10f, 0.14f, 1f); sr.rect(nx, newsBlockY, nw, newsBlockH)
            sr.color = TankiStyle.ORANGE;               sr.rect(nx, newsBlockY + newsBlockH - 2f, nw, 2f)
        }

        sr.end()

        sr.begin(ShapeRenderer.ShapeType.Line)
        exitBtn?.drawBorder(sr)
        sr.end()

        // ══ PASS 2: SpriteBatch ═══════════════════════════════════════════════
        batch.begin()

        // Вкладки
        tabs.forEach { tab ->
            val gl = GlyphLayout(nf, tab.label)
            nf.color = Color.WHITE
            nf.draw(batch, tab.label, tab.x + (tab.w - gl.width) / 2f,
                navY + NAV_H - (NAV_H - gl.height) / 2f)
        }
        exitBtn?.drawText(batch, nf)

        // Логотип в центре экрана — полупрозрачный фон
        logoTex?.let { tex ->
            val logoH = 200f
            val logoW = logoH * (tex.width.toFloat() / tex.height.toFloat())
            batch.setColor(1f, 1f, 1f, 0.12f)
            batch.draw(tex, (w - logoW) / 2f, (h - logoH) / 2f, logoW, logoH)
            batch.setColor(1f, 1f, 1f, 1f)
        }

        // Панель игрока
        if (user != null) {
            // Иконка ранга — изображение
            val rankTex = com.tanki.client.utils.RankTextures.get(user.rank, user.premium)
            if (rankTex != null) {
                batch.draw(rankTex, panelX, py, rankSize, rankSize)
            } else {
                // fallback — цветной квадрат с номером
                inf.color = Color.WHITE
                val rl = GlyphLayout(inf, "${user.rank}")
                inf.draw(batch, "${user.rank}", panelX + (rankSize - rl.width) / 2f,
                    py + (rankSize + rl.height) / 2f)
            }
            inf.color = Color.WHITE
            inf.draw(batch, user.username, barX, py + rankSize - 2f)
            nwf.color = TankiStyle.TEXT_GRAY
            nwf.draw(batch, "${user.experience} / ${user.experience + user.nextScore}", barX, barY - 2f)
            inf.color = Color(0.85f, 0.92f, 1.0f, 1f)
            inf.draw(batch, "${user.crystals}", crystalX + 14f, py + rankSize - 2f)
        }

        // Новость
        if (news != null) {
            nwf.color = TankiStyle.ORANGE
            nwf.draw(batch, "${news.header}  —  ${news.date}", nx + 10f, newsBlockY + newsBlockH - 8f)
            nwf.color = Color(0.80f, 0.80f, 0.80f, 1f)
            newsLines.forEachIndexed { i, line ->
                nwf.draw(batch, line, nx + 10f, newsBlockY + newsBlockH - 28f - i * 18f)
            }
        }

        batch.end()

        // ── Клики ─────────────────────────────────────────────────────────────
        if (Gdx.input.justTouched()) {
            val mx = Gdx.input.x.toFloat()
            val my = h - Gdx.input.y.toFloat()
            tabs.forEach { tab ->
                if (mx in tab.x..(tab.x + tab.w) && my in navY..h) tab.action()
            }
            exitBtn?.checkClick(mx, my)
        }
    }

    private fun rankColor(rank: Int): Color = when (rank) {
        in 1..3   -> Color(0.30f, 0.55f, 0.30f, 1f)
        in 4..7   -> Color(0.25f, 0.45f, 0.75f, 1f)
        in 8..12  -> Color(0.65f, 0.45f, 0.10f, 1f)
        in 13..17 -> Color(0.55f, 0.55f, 0.60f, 1f)
        in 18..22 -> Color(0.75f, 0.60f, 0.15f, 1f)
        else      -> Color(0.80f, 0.30f, 0.30f, 1f)
    }

    override fun dispose() {
        // Шрифты управляются FontGenerator
        logoTex?.dispose()
        com.tanki.client.utils.RankTextures.dispose()
    }
}
