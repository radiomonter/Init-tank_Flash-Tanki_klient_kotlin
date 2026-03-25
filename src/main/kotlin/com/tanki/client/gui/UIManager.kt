package com.tanki.client.gui

import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import org.slf4j.LoggerFactory

class UIManager {
    private val logger = LoggerFactory.getLogger(UIManager::class.java)

    private lateinit var loginScreen:    LoginScreen
    private lateinit var registerScreen: RegisterScreen
    private lateinit var mainMenu:       MainMenuScreen
    private lateinit var lobbyScreen:    LobbyScreen
    private lateinit var garageScreen:   GarageScreen
    private lateinit var battleScreen:   BattleScreen

    private var currentScreen: UIScreen? = null

    fun initialize() {
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
            logger.info("Rendering screen: $screen")
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
        logger.info("UIManager disposed")
    }
}

enum class ScreenType { LOGIN, REGISTER, MAIN_MENU, LOBBY, GARAGE, BATTLE }
