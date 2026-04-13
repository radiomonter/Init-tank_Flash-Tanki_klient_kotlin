package com.tanki.client.gui

import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.Color
import com.tanki.client.utils.FontGenerator
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class UIManager : KoinComponent {
    private val logger = LoggerFactory.getLogger(UIManager::class.java)

    // Общий кэш шрифтов для всех экранов
    private val fontCache = mutableMapOf<Int, BitmapFont>()
    
    val getFont: (Int) -> BitmapFont = { size ->
        fontCache.getOrPut(size) {
            logger.info("Создаём шрифт размера $size")
            FontGenerator.makeFont(size)
        }
    }

    private lateinit var loginScreen:    LoginScreen
    private lateinit var registerScreen: RegisterScreen
    private lateinit var mainMenu:       MainMenuScreen
    private lateinit var lobbyScreen:    LobbyScreen
    private lateinit var garageScreen:   GarageScreen
    private lateinit var battleScreen:   BattleScreen

    private var currentScreen: UIScreen? = null

    fun initialize() {
        // Предзагружаем стандартные размеры шрифтов
        listOf(13,14,15,16,17,18,24,42).forEach { getFont(it) }
        logger.info("Шрифты предзагружены")
        
        loginScreen    = LoginScreen()
        registerScreen = RegisterScreen()
        mainMenu       = MainMenuScreen()
        lobbyScreen    = LobbyScreen()
        garageScreen   = GarageScreen()
        battleScreen   = BattleScreen()
        
        showScreen(ScreenType.LOGIN)
        logger.info("UIManager initialized")
    }

    fun showScreen(type: ScreenType) {
        logger.info("Switching screen from $currentScreen to $type")
        currentScreen?.hide()
        currentScreen = when (type) {
            ScreenType.LOGIN      -> loginScreen
            ScreenType.REGISTER   -> registerScreen
            ScreenType.MAIN_MENU  -> {
                logger.info("Setting mainMenu as current screen")
                mainMenu
            }
            ScreenType.LOBBY      -> lobbyScreen
            ScreenType.GARAGE     -> garageScreen
            ScreenType.BATTLE     -> battleScreen
        }
        currentScreen?.show()
        logger.info("Screen → $type, currentScreen is now: $currentScreen")
    }

    fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        currentScreen?.let { screen ->
            screen.render(batch, sr)
        } ?: logger.warn("No current screen to render")
    }

    fun getCurrentScreen(): UIScreen? = currentScreen

    fun resize(width: Int, height: Int) = currentScreen?.resize(width, height)

    fun dispose() {
        loginScreen.dispose()
        registerScreen.dispose()
        mainMenu.dispose()
        lobbyScreen.dispose()
        garageScreen.dispose()
        battleScreen.dispose()
        
        // Безопасно удаляем шрифты UIManager
        fontCache.values.forEach { 
            try { it.dispose() } catch (e: Exception) { logger.warn("Шрифт уже удалён: ${e.message}") }
        }
        fontCache.clear()
        logger.info("UIManager disposed")
    }
}

enum class ScreenType { LOGIN, REGISTER, MAIN_MENU, LOBBY, GARAGE, BATTLE }

