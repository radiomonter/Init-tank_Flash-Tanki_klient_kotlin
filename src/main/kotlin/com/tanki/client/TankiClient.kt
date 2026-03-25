package com.tanki.client

import com.badlogic.gdx.backends.lwjgl.LwjglApplication
import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration
import com.tanki.client.core.GameEngine
import com.tanki.client.di.gameModule
import org.koin.core.context.startKoin
import org.slf4j.LoggerFactory

private val logger = LoggerFactory.getLogger("TankiClient")

fun main() {
    logger.info("Starting Tanki Client...")

    startKoin { modules(gameModule) }

    val config = LwjglApplicationConfiguration().apply {
        title       = "Tanki Client - Kotlin"
        width       = 1024
        height      = 768
        resizable   = true  // ALLOW RESIZING!
        vSyncEnabled = true
        foregroundFPS = 60
        backgroundFPS = 60
        useGL30     = false
        samples     = 4
    }

    LwjglApplication(GameEngine(), config)
}
