package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.News
import com.tanki.client.utils.SimpleTextRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.utils.FontGenerator
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class MainMenuScreen : UIScreen(), KoinComponent {
    
    private val logger = LoggerFactory.getLogger("MainMenuScreen")
    
    // Inject dependencies
    private val uiManager: UIManager by inject()
    private val userModel: UserModel by inject()

    private var titleFont:  BitmapFont? = null
    private var subFont:    BitmapFont? = null

    private var garageButton: Button? = null
    private var battleButton: Button? = null
    private var exitButton:   Button? = null

    private var uiBuilt = false
    private var newsShown = false

    private fun ensureUI() {
        if (uiBuilt) return
        uiBuilt = true
        
        // Initialize fonts
        titleFont = FontGenerator.makeFont(24)
        subFont   = FontGenerator.makeFont(16)
        
        // Initialize buttons
        garageButton = Button(0f, 0f, 80f, 35f, "ГАРАЖ", { uiManager.showScreen(ScreenType.GARAGE) })
        battleButton = Button(0f, 0f, 80f, 35f, "БОИ", { uiManager.showScreen(ScreenType.LOBBY) })
        exitButton   = Button(0f, 0f, 80f, 35f, "ВЫХОД", { Gdx.app.exit() })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        ensureUI()
        
        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        
        // Draw gradient background
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.05f, 0.05f, 0.08f, 1f)
        sr.rect(0f, 0f, w, h)
        
        // Gradient effect
        sr.color = Color(0.08f, 0.08f, 0.12f, 0.7f)
        sr.rect(0f, 0f, w, h * 0.4f)
        sr.end()
        
        // Get user data
        val user = userModel.getCurrentUser()
        val tank = userModel.getCurrentTank()
        val tankSpec = userModel.getCurrentTankSpec()
        
        // Draw Main Panel (authentic Flash client style)
        if (user != null && tank != null && tankSpec != null) {
            
            // Main panel background - very thin at top (y=3)
            sr.begin(ShapeRenderer.ShapeType.Filled)
            sr.color = Color(0.12f, 0.12f, 0.16f, 0.95f)
            sr.rect(0f, h - 45f, w, 45f)
            
            // Top border line
            sr.color = Color(0.05f, 0.85f, 0.85f, 1f)
            sr.rect(0f, h - 45f, w, 2f)
            
            // Bottom shadow
            sr.color = Color(0.0f, 0.0f, 0.0f, 0.4f)
            sr.rect(0f, h - 3f, w, 3f)
            sr.end()
            
            // Логотип Init-tank в центре
            batch.begin()
            val logoFont = FontGenerator.makeFont(24)
            logoFont.color = Color.WHITE
            val logoLayout = GlyphLayout(logoFont, "Init-tank")
            logoFont.draw(batch, "Init-tank", (w - logoLayout.width) / 2f, h - 28f)
            logoFont.dispose()
            batch.end()
            
            // Иконка ранга (слева, по центру вертикально)
            sr.begin(ShapeRenderer.ShapeType.Filled)
            val rankColor = when (user.rank) {
                in 1..3 -> Color(0.3f, 0.7f, 0.3f, 1f)
                in 4..10 -> Color(0.3f, 0.5f, 0.8f, 1f)
                in 11..20 -> Color(0.8f, 0.3f, 0.3f, 1f)
                else -> Color(0.8f, 0.7f, 0.2f, 1f)
            }
            val rankIconSize = 30f
            val rankIconX = 20f
            val rankIconY = h - 35f
            sr.color = Color(0.0f, 0.0f, 0.0f, 0.5f)
            sr.rect(rankIconX, rankIconY, rankIconSize, rankIconSize)
            sr.color = Color(1f, 1f, 1f, 0.3f)
            sr.rect(rankIconX + 1f, rankIconY + 1f, rankIconSize - 2f, rankIconSize - 2f)
            sr.end()
            
            // Информация об игроке (слева)
            batch.begin()
            val nameFont = FontGenerator.makeFont(18)
            val smallFont = FontGenerator.makeFont(14)
            
            nameFont.color = Color.WHITE
            nameFont.draw(batch, user.username, 70f, h - 20f)
            
            // Фон прогресс-бара
            sr.begin(ShapeRenderer.ShapeType.Filled)
            sr.color = Color(0.05f, 0.05f, 0.08f, 1f)
            sr.rect(70f, h - 30f, 150f, 6f)
            
            // Заполнение прогресс-бара
            val progress = (user.experience % 1000) / 1000f
            sr.color = Color(0.05f, 0.85f, 0.85f, 1f)
            sr.rect(70f, h - 30f, 150f * progress, 6f)
            sr.end()
            
            // Текст ранга и кристаллов
            smallFont.color = Color.WHITE
            smallFont.draw(batch, "Ранг ${user.rank}", 70f, h - 40f)
            smallFont.draw(batch, "💎 ${user.crystals}", 150f, h - 40f)
            
            batch.end()
        } else {
            // Нарисуем базовую панель даже без данных
            sr.begin(ShapeRenderer.ShapeType.Filled)
            sr.color = Color(0.12f, 0.12f, 0.16f, 0.95f)
            sr.rect(0f, h - 45f, w, 45f)
            sr.color = Color(0.05f, 0.85f, 0.85f, 1f)
            sr.rect(0f, h - 45f, w, 2f)
            sr.end()
            
            batch.begin()
            val font = FontGenerator.makeFont(16)
            font.color = Color.WHITE
            font.draw(batch, "Загрузка данных...", 10f, h - 25f)
            batch.end()
        }
        
        // Отображение новости если есть
        val news = userModel.currentNews
        if (news != null) {
            if (!newsShown) {
                logger.info("Rendering news: ${news.header}")
                newsShown = true
            }
            renderNews(batch, sr, news, w, h)
        } else {
            if (newsShown) {
                logger.debug("News was shown but now null")
                newsShown = false
            }
        }
        
        // Отрисовка панели кнопок (справа, адаптивная)
        ensureUI()
        val buttonY = h - 35f
        val buttonSpacing = 10f
        
        // Адаптивное позиционирование кнопок
        val availableWidth = w - 200f
        val buttonCount = 3
        val maxButtonWidth = 80f
        val totalButtonWidth = buttonCount * maxButtonWidth + (buttonCount - 1) * buttonSpacing
        
        val buttonBarX = if (totalButtonWidth < availableWidth) {
            w - totalButtonWidth - 20f
        } else {
            w - 20f - buttonCount * (availableWidth / buttonCount)
        }
        
        // Обновляем позиции кнопок
        garageButton?.let { 
            it.x = buttonBarX + maxButtonWidth + buttonSpacing
            it.y = buttonY
        }
        battleButton?.let { 
            it.x = buttonBarX
            it.y = buttonY
        }
        exitButton?.let { 
            it.x = buttonBarX + (maxButtonWidth + buttonSpacing) * 2
            it.y = buttonY
        }
        
        // Отрисовываем кнопки
        sr.begin(ShapeRenderer.ShapeType.Filled)
        garageButton?.drawFill(sr)
        battleButton?.drawFill(sr)
        exitButton?.drawFill(sr)
        sr.end()
        
        sr.begin(ShapeRenderer.ShapeType.Line)
        garageButton?.drawBorder(sr)
        battleButton?.drawBorder(sr)
        exitButton?.drawBorder(sr)
        sr.end()
        
        batch.begin()
        val buttonFont = FontGenerator.makeFont(18)
        buttonFont.color = Color.WHITE
        garageButton?.drawText(batch, buttonFont)
        battleButton?.drawText(batch, buttonFont)
        exitButton?.drawText(batch, buttonFont)
        batch.end()
        
        // Обработка ввода
        if (Gdx.input.justTouched()) {
            val x = Gdx.input.x.toFloat()
            val y = Gdx.graphics.height - Gdx.input.y.toFloat()
            garageButton?.checkClick(x, y)
            battleButton?.checkClick(x, y)
            exitButton?.checkClick(x, y)
        }
    }
    
    private fun renderNews(batch: SpriteBatch, sr: ShapeRenderer, news: News, w: Float, h: Float) {
        val newsY = h - 100f
        val newsWidth = w - 40f
        val newsHeight = 120f
        val newsX = 20f
        
        // Фон новости
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.15f, 0.15f, 0.2f, 0.9f)
        sr.rect(newsX, newsY - newsHeight, newsWidth, newsHeight)
        
        // Граница
        sr.color = Color(0.05f, 0.85f, 0.85f, 1f)
        sr.rect(newsX, newsY - newsHeight, newsWidth, 2f)
        sr.rect(newsX, newsY - newsHeight, 2f, newsHeight)
        sr.rect(newsX + newsWidth - 2f, newsY - newsHeight, 2f, newsHeight)
        sr.end()
        
        batch.begin()
        SimpleTextRenderer.drawText(batch, news.header, newsX + 10f, newsY - 20f, 18f, Color.WHITE)
        SimpleTextRenderer.drawText(batch, news.date, newsX + 10f, newsY - 40f, 14f, Color.GRAY)
        
// Текст новости - многострочный preview (3 строки)
        logger.info("News text for rendering: '${news.text}' (length: ${news.text.length})")
        val lines = news.text.replace("\\n", "\n").split("\n").take(3)
        logger.info("News lines after split: $lines")
        lines.forEachIndexed { index, line ->
            val lineText = line.take(80) + if (line.length > 80) "..." else ""
            logger.info("Rendering line $index: '$lineText' (original: '$line')")
            
            // Check if line is empty or contains only invisible characters
            val displayText = if (lineText.isBlank() || lineText.all { it == '?' }) {
                if (index == 0) "News content..." else ""
            } else {
                lineText
            }
            
            SimpleTextRenderer.drawText(batch, displayText, newsX + 10f, newsY - 55f - index * 16f, 13f, Color.LIGHT_GRAY)
        }
        if (news.text.contains("\n") || news.text.length > 240) {
            SimpleTextRenderer.drawText(batch, "читать дальше...", newsX + newsWidth - 100f, newsY - 75f, 12f, Color(0.3f, 0.7f, 0.9f, 1f))
        }
        batch.end()
    }

    


    override fun dispose() {
        titleFont?.dispose()
        subFont?.dispose()
    }
}
