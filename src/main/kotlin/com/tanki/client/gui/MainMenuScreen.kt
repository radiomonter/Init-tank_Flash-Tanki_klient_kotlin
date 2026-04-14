package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.models.NewsModel
import com.tanki.client.utils.NineSlice
import com.tanki.client.utils.RankTextures
import com.tanki.client.utils.UITextures
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

    private val RANK_NAMES = listOf(
        "Новобранец","Рядовой","Ефрейтор","Капрал","Мастер-капрал",
        "Сержант","Штаб-сержант","Мастер-сержант","Первый сержант","Сержант-майор",
        "Уорент-офицер 1","Уорент-офицер 2","Уорент-офицер 3","Уорент-офицер 4","Уорент-офицер 5",
        "Младший лейтенант","Лейтенант","Старший лейтенант","Капитан","Майор",
        "Подполковник","Полковник","Бригадир","Генерал-майор","Генерал-лейтенант",
        "Генерал","Маршал","Фельдмаршал","Командор","Генералиссимус","Легенда"
    )

    private fun ensureUI() {
        if (uiBuilt) return; uiBuilt = true
        navFont  = makeFont(15)
        infoFont = makeFont(14)
        newsFont = makeFont(14)
        try {
            logoTex = com.badlogic.gdx.graphics.Texture(
                Gdx.files.internal("init-tank-logo.png")
            ).also { it.setFilter(
                com.badlogic.gdx.graphics.Texture.TextureFilter.Linear,
                com.badlogic.gdx.graphics.Texture.TextureFilter.Linear
            ) }
        } catch (_: Exception) {}
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

        val w    = Gdx.graphics.width.toFloat()
        val h    = Gdx.graphics.height.toFloat()
        val nf   = navFont!!; val inf = infoFont!!; val nwf = newsFont!!
        val navY = h - NAV_H
        val user = userModel.getCurrentUser()
        val news = newsModel.getLatest()

        // Обновляем позицию кнопки ВЫХОД каждый кадр
        exitBtn?.let { it.y = navY + (NAV_H - it.height) / 2f; it.x = w - 90f }

        // ── Вычисляем вкладки (справа перед ВЫХОД) ───────────────────────────
        val exitBtnW = 90f
        var tabX = w - exitBtnW - 10f
        tabs.asReversed().forEach { tab ->
            val gl = GlyphLayout(nf, tab.label)
            tab.w = gl.width + TAB_PAD * 2
            tabX -= tab.w
            tab.x = tabX
        }

        // ── Размеры панели игрока ─────────────────────────────────────────────
        val rankSize  = NAV_H - 8f
        val panelX    = 10f
        val barH      = NAV_H - 16f
        val barY      = navY + (NAV_H - barH) / 2f
        val barX      = panelX + rankSize + 8f
        val crystalW  = 110f
        val crystalGap = 8f
        val firstTabX = tabs.minOfOrNull { it.x } ?: w
        val barW      = firstTabX - barX - crystalW - crystalGap - 8f
        val crystalX  = barX + barW + crystalGap
        val crystalY  = barY
        val progress  = if (user != null) {
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
        sr.color = Color(0.05f, 0.07f, 0.10f, 1f); sr.rect(0f, 0f, w, h)
        sr.color = Color(0.08f, 0.10f, 0.14f, 1f); sr.rect(0f, navY, w, NAV_H)
        sr.color = TankiStyle.ORANGE;               sr.rect(0f, navY - 2f, w, 2f)
        tabs.forEach { tab ->
            sr.color = Color(0.12f, 0.15f, 0.20f, 1f); sr.rect(tab.x, navY, tab.w, NAV_H)
            sr.color = Color(0.20f, 0.24f, 0.30f, 1f); sr.rect(tab.x + tab.w - 1f, navY, 1f, NAV_H)
        }
        exitBtn?.drawFill(sr)
        // Металлическая рамка через ShapeRenderer (серая) + зелёный прогресс
        if (user != null) {
            val edgeW = 6f  // толщина металлической рамки

            // Серая металлическая рамка — прогресс-бар
            sr.color = Color(0.55f, 0.55f, 0.55f, 1f)
            sr.rect(barX - edgeW, barY - edgeW, barW + edgeW * 2, barH + edgeW * 2)
            // Тёмно-зелёный внутренний фон (не чёрный)
            sr.color = Color(0.0f, 0.15f, 0.0f, 1f)
            sr.rect(barX, barY, barW, barH)

            // Серая металлическая рамка — кристаллы
            sr.color = Color(0.55f, 0.55f, 0.55f, 1f)
            sr.rect(crystalX - edgeW, crystalY - edgeW, crystalW + edgeW * 2, barH + edgeW * 2)
            sr.color = Color(0.0f, 0.15f, 0.0f, 1f)
            sr.rect(crystalX, crystalY, crystalW, barH)

            // Зелёный прогресс поверх тёмного фона
            val fillW = (barW * progress).coerceAtLeast(0f)
            if (fillW > 0f) {
                sr.color = Color(18/255f, 252/255f, 0f, 0.35f)
                sr.rect(barX, barY, fillW, barH)
            }
        }
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

        // Логотип в центре — полупрозрачный
        logoTex?.let { tex ->
            val logoH = 200f
            val logoW = logoH * (tex.width.toFloat() / tex.height.toFloat())
            batch.setColor(1f, 1f, 1f, 0.12f)
            batch.draw(tex, (w - logoW) / 2f, (h - logoH) / 2f, logoW, logoH)
            batch.setColor(1f, 1f, 1f, 1f)
        }

        // ── Панель игрока ─────────────────────────────────────────────────────
        if (user != null) {
            // Иконка ранга
            val rankTex = RankTextures.get(user.rank, user.premium)
            if (rankTex != null) {
                batch.draw(rankTex, panelX, navY + (NAV_H - rankSize) / 2f, rankSize, rankSize)
            } else {
                inf.color = Color.WHITE
                val rl = GlyphLayout(inf, "${user.rank}")
                inf.draw(batch, "${user.rank}", panelX + (rankSize - rl.width) / 2f,
                    navY + (NAV_H + rl.height) / 2f)
            }

            // Края рамки (без центра — он прозрачный через ShapeRenderer)
            val fL = UITextures.frameLeft; val fR = UITextures.frameRight
            val edgeW = if (fL != null) (barH + 12f) * fL.width.toFloat() / fL.height.toFloat() else 7f
            fL?.let { batch.draw(it, barX - 6f, barY - 6f, edgeW, barH + 12f) }
            fR?.let { batch.draw(it, barX + barW + 6f - edgeW, barY - 6f, edgeW, barH + 12f) }

            // Текст на баре
            val rankName = RANK_NAMES.getOrElse(user.rank - 1) { "Ранг ${user.rank}" }
            nwf.color = Color(0.4f, 1.0f, 0.4f, 1f)
            nwf.draw(batch, "${user.experience} / ${user.experience + user.nextScore}  $rankName  ${user.username}",
                barX + 6f, barY + barH - 6f)

            // Кристаллы: края рамки
            fL?.let { batch.draw(it, crystalX - 6f, crystalY - 6f, edgeW, barH + 12f) }
            fR?.let { batch.draw(it, crystalX + crystalW + 6f - edgeW, crystalY - 6f, edgeW, barH + 12f) }
            val crystalStr = "%,d".format(user.crystals).replace(",", " ")
            inf.color = Color(0.4f, 1.0f, 0.4f, 1f)
            inf.draw(batch, crystalStr, crystalX + 6f, crystalY + barH - 6f)
            val cTex = UITextures.crystalSmall ?: UITextures.crystalBig
            if (cTex != null) {
                val iconSize = barH - 10f
                batch.draw(cTex, crystalX + crystalW - iconSize - 5f, crystalY + 5f, iconSize, iconSize)
            }
        }

        // ── Новость ───────────────────────────────────────────────────────────
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

    override fun dispose() {
        logoTex?.dispose()
        RankTextures.dispose()
        UITextures.dispose()
    }
}
