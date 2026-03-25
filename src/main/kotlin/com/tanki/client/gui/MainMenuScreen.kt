package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.UserModel
import com.tanki.client.utils.FontGenerator
import com.tanki.client.utils.FontGenerator.makeFont
import com.tanki.client.utils.FontGenerator.makeLatinFont
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
    private var buttonFont: BitmapFont? = null

    private var garageButton: Button? = null
    private var battleButton: Button? = null
    private var exitButton:   Button? = null

    private var uiBuilt = false

    private fun ensureUI() {
        if (uiBuilt) return
        uiBuilt = true
        
        logger.info("MainMenuScreen ensureUI - checking user data...")
        
        val cx = Gdx.graphics.width / 2f
        val cy = Gdx.graphics.height / 2f
        
        // Create buttons with proper sizes for the main menu
        val bw = 80f; val bh = 30f; val gap = 5f
        garageButton = Button(0f, 0f, bw, bh, "ГАРАЖ", { uiManager.showScreen(ScreenType.GARAGE) }, style = ButtonStyle.ACCENT)
        battleButton = Button(0f, 0f, bw, bh, "В БОЙ", { 
            logger.info("Battle button clicked - going to lobby")
            uiManager.showScreen(ScreenType.LOBBY)
        },  style = ButtonStyle.GREEN)
        exitButton   = Button(0f, 0f, bw, bh, "ВЫХОД", { Gdx.app.exit() })
    }

    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        
        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        
        // Tanki Online authentic background with gradient
        sr.begin(ShapeRenderer.ShapeType.Filled)
        // Dark gradient background
        sr.color = Color(0.05f, 0.05f, 0.08f, 1f) // Very dark top
        sr.rect(0f, 0f, w, h)
        
        // Gradient effect
        sr.color = Color(0.08f, 0.08f, 0.12f, 0.7f) // Slightly lighter
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
            sr.color = Color(0.12f, 0.12f, 0.16f, 0.95f) // Panel background
            sr.rect(0f, h - 45f, w, 45f)
            
            // Top border line
            sr.color = Color(0.05f, 0.85f, 0.85f, 1f) // Flash orange
            sr.rect(0f, h - 45f, w, 2f)
            
            // Bottom shadow
            sr.color = Color(0.0f, 0.0f, 0.0f, 0.4f)
            sr.rect(0f, h - 3f, w, 3f)
            sr.end()
            
            // Логотип Init-tank в центре - простой подход
            batch.begin()
            val logoFont = makeFont(24) // Больше размер, простой шрифт
            
            // Простая тень
            logoFont.color = Color(0f, 0f, 0f, 0.5f)
            val logoLayout = com.badlogic.gdx.graphics.g2d.GlyphLayout(logoFont, "Init-tank")
            logoFont.draw(batch, "Init-tank", (w - logoLayout.width) / 2f + 1f, h - 28f - 1f)
            
            // Основной текст
            logoFont.color = Color(1f, 0.2f, 0.2f, 1f)
            logoFont.draw(batch, "Init-tank", (w - logoLayout.width) / 2f, h - 28f)
            batch.end()
            
            // Иконка ранга (слева, по центру вертикально)
            sr.begin(ShapeRenderer.ShapeType.Filled)
            val rankColor = when (user.rank) {
                in 1..3 -> Color(0.3f, 0.7f, 0.3f, 1f) // Зеленый
                in 4..10 -> Color(0.3f, 0.5f, 0.8f, 1f) // Синий  
                in 11..20 -> Color(0.8f, 0.3f, 0.3f, 1f) // Красный
                else -> Color(0.8f, 0.7f, 0.2f, 1f) // Золотой
            }
            sr.color = rankColor
            val rankIconSize = 32f
            val rankIconX = 38f - (rankIconSize / 2f)
            val rankIconY = (h - 45f) + 29f - (rankIconSize / 2f)
            sr.rect(rankIconX, rankIconY, rankIconSize, rankIconSize)
            
            // Граница иконки ранга
            sr.color = Color(0.0f, 0.0f, 0.0f, 0.5f)
            sr.rect(rankIconX, rankIconY, rankIconSize, rankIconSize)
            sr.color = Color(1f, 1f, 1f, 0.3f)
            sr.rect(rankIconX + 1f, rankIconY + 1f, rankIconSize - 2f, rankIconSize - 2f)
            sr.end()
            
            // Информация об игроке (слева) - Flash стиль с тенями
            batch.begin()
            val nameFont = makeFont(16)
            val smallFont = makeFont(12)
            
            // Имя игрока с тенью
            nameFont.color = Color(0f, 0f, 0f, 0.7f) // Тень
            nameFont.draw(batch, user.username, 70f + 1f, h - 20f - 1f)
            nameFont.color = Color(0.2f, 1f, 0.2f, 1f) // ЯРКО-ЗЕЛЕНЫЙ
            nameFont.draw(batch, user.username, 70f, h - 20f)
            
            // Фон прогресс-бара
            sr.begin(ShapeRenderer.ShapeType.Filled)
            sr.color = Color(0.05f, 0.05f, 0.08f, 1f)
            sr.rect(70f, h - 30f, 150f, 6f)
            
            // Заполнение прогресс-бара
            val progress = (user.experience % 1000) / 1000f
            sr.color = Color(0.05f, 0.85f, 0.85f, 1f) // Flash оранжевый
            sr.rect(70f, h - 30f, 150f * progress, 6f)
            sr.end()
            
            // Текст ранга и кристаллов - Flash стиль с тенями
            smallFont.color = Color(0f, 0f, 0f, 0.7f) // Тень
            smallFont.draw(batch, "Ранг ${user.rank}", 70f + 1f, h - 40f - 1f)
            smallFont.draw(batch, "💎 ${user.crystals}", 150f + 1f, h - 40f - 1f)
            
            smallFont.color = Color(1f, 1f, 0.2f, 1f) // ЯРКО-ЖЕЛТЫЙ
            smallFont.draw(batch, "Ранг ${user.rank}", 70f, h - 40f)
            
            smallFont.color = Color(1f, 0.5f, 1f, 1f) // ЯРКО-МАЛИНОВЫЙ
            smallFont.draw(batch, "💎 ${user.crystals}", 150f, h - 40f)
            
            batch.end()
        }
        
        // Отрисовка панели кнопок (аутентичный стиль Flash клиента - справа, адаптивная)
        ensureUI()
        val buttonY = h - 35f
        val buttonHeight = 30f
        val buttonSpacing = 2f
        
        // Адаптивное позиционирование кнопок - убедиться что все помещаются на экране
        val availableWidth = w - 200f // Оставить место для информации об игроке слева
        val buttonCount = 3 // Показываем только наши 3 кнопки (Бои, Гараж, ВЫХОД)
        val maxButtonWidth = 80f
        val totalButtonWidth = buttonCount * maxButtonWidth + (buttonCount - 1) * buttonSpacing
        
        // Вычисляем начальную позицию чтобы все кнопки поместились
        val buttonBarX = if (totalButtonWidth < availableWidth) {
            w - totalButtonWidth - 20f // Выровнено по правому краю если помещается
        } else {
            w - 20f - buttonCount * (availableWidth / buttonCount) // Сжато если нужно
        }
        
        // Обновляем позиции кнопок чтобы поместились на экране
        garageButton?.let { 
            it.x = buttonBarX + maxButtonWidth + buttonSpacing // Вторая кнопка
            it.y = buttonY
        }
        battleButton?.let { 
            it.x = buttonBarX // Первая кнопка
            it.y = buttonY
        }
        exitButton?.let { 
            it.x = buttonBarX + (maxButtonWidth + buttonSpacing) * 2 // Третья кнопка
            it.y = buttonY
        }
        
        // Отрисовываем кнопки с аутентичным Flash стилем
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
        val buttonFont = makeFont(16) // Больше для лучшей читаемости
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

    override fun dispose() {
        titleFont?.dispose(); subFont?.dispose(); buttonFont?.dispose()
    }
}
