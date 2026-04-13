package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.models.Tank
import com.tanki.client.models.TankSpec
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

        // Фон
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.08f, 0.05f, 0.05f, 1f); sr.rect(0f, 0f, w, h)
        backButton?.drawFill(sr)
        sr.end()
        
        // Заголовок гаража
        batch.begin()
        f.color = TankiStyle.ORANGE
        f.draw(batch, "ГАРАЖ", 50f, h - 50f)
        batch.end()
        
        // Получаем данные о танке
        val user = userModel.getCurrentUser()
        val tank = userModel.getCurrentTank()
        val tankSpec = tank?.let { userModel.getTankSpec(it.hullId) }
        
        if (tank != null && tankSpec != null) {
            // Отображаем информацию о танке
            renderTankInfo(batch, sr, tank, tankSpec, w, h, f)
            renderTankVisualization(sr, w, h, tank, tankSpec)
        } else {
            // Нет танка
            batch.begin()
            f.color = TankiStyle.TEXT_GRAY
            f.draw(batch, "Танк не выбран", 50f, h - 150f)
            batch.end()
        }
        
        // Информация о пользователе
        batch.begin()
        if (user != null) { 
            f.color = TankiStyle.ORANGE; 
            f.draw(batch, "Кристаллы: ${user.crystals}", w - 220f, h - 50f) 
        }
        backButton?.drawText(batch, bf)
        batch.end()
        
        // Кнопки
        sr.begin(ShapeRenderer.ShapeType.Line)
        backButton?.drawBorder(sr)
        sr.end()

        if (Gdx.input.justTouched()) {
            val x = Gdx.input.x.toFloat(); val y = Gdx.graphics.height - Gdx.input.y.toFloat()
            backButton?.checkClick(x, y)
        }
    }
    
    private fun renderTankInfo(batch: SpriteBatch, sr: ShapeRenderer, tank: Tank, tankSpec: TankSpec, w: Float, h: Float, font: BitmapFont) {
        batch.begin()
        
        // Название танка
        font.color = Color.WHITE
        font.draw(batch, tank.name, 50f, h - 120f)
        
        // Характеристики
        font.color = TankiStyle.TEXT_GRAY
        font.draw(batch, "Скорость: ${tankSpec.speed}", 50f, h - 150f)
        font.draw(batch, "Броня: ${tankSpec.armor}", 50f, h - 170f)
        font.draw(batch, "Урон: ${tankSpec.damage}", 50f, h - 190f)
        font.draw(batch, "Ранг: ${tankSpec.rank}", 50f, h - 210f)
        
        // Статистика
        font.color = Color.CYAN
        font.draw(batch, "Рейтинг: ${tank.rating}", 50f, h - 240f)
        font.draw(batch, "Бои: ${tank.battles}", 50f, h - 260f)
        font.draw(batch, "Победы: ${tank.wins}", 50f, h - 280f)
        
        // Модификации
        if (tank.modifications.isNotEmpty()) {
            font.color = Color.YELLOW
            font.draw(batch, "Моды: ${tank.modifications.joinToString(", ")}", 50f, h - 310f)
        }
        
        batch.end()
    }
    
    private fun renderTankVisualization(sr: ShapeRenderer, w: Float, h: Float, tank: Tank, tankSpec: TankSpec) {
        // Визуализация танка в центре экрана
        val centerX = w / 2f
        val centerY = h / 2f - 50f
        val tankSize = 120f
        
        sr.begin(ShapeRenderer.ShapeType.Filled)
        
        // Корпус танка
        sr.color = Color(0.3f, 0.4f, 0.3f, 1f) // Зеленый цвет корпуса
        sr.rect(centerX - tankSize/2, centerY - tankSize/3, tankSize, tankSize/1.5f)
        
        // Башня
        sr.color = Color(0.25f, 0.35f, 0.25f, 1f) // Темнее для башни
        sr.circle(centerX, centerY, tankSize/3f)
        
        // Орудие
        sr.color = Color(0.2f, 0.2f, 0.2f, 1f) // Черное орудие
        sr.rect(centerX + tankSize/3f, centerY - 5f, tankSize/1.5f, 10f)
        
        // Гусеницы
        sr.color = Color(0.15f, 0.15f, 0.15f, 1f) // Темные гусеницы
        sr.rect(centerX - tankSize/2 - 10f, centerY - tankSize/3 - 5f, 10f, tankSize/1.5f + 10f)
        sr.rect(centerX + tankSize/2, centerY - tankSize/3 - 5f, 10f, tankSize/1.5f + 10f)
        
        // Цветовая индикация типа танка
        sr.color = when (tankSpec.id) {
            "hunter" -> Color(0.2f, 0.8f, 0.2f, 1f) // Зеленый для легкого
            "viking" -> Color(0.2f, 0.2f, 0.8f, 1f) // Синий для среднего
            "dictator", "mammoth" -> Color(0.8f, 0.2f, 0.2f, 1f) // Красный для тяжелого
            else -> Color(0.8f, 0.8f, 0.2f, 1f) // Желтый для остальных
        }
        sr.rect(centerX - tankSize/2 + 5f, centerY - tankSize/3 + 5f, tankSize - 10f, tankSize/1.5f - 10f)
        
        sr.end()
        
        // Обводка для детализации
        sr.begin(ShapeRenderer.ShapeType.Line)
        sr.color = Color.BLACK
        sr.rect(centerX - tankSize/2, centerY - tankSize/3, tankSize, tankSize/1.5f)
        sr.circle(centerX, centerY, tankSize/3f)
        sr.rect(centerX + tankSize/3f, centerY - 5f, tankSize/1.5f, 10f)
        sr.end()
    }

    override fun dispose() { font?.dispose(); buttonFont?.dispose() }
}
