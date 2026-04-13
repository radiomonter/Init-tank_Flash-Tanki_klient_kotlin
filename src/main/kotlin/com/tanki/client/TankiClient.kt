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
        title         = "Init-tank Client"
        width         = 1024
        height        = 768
        resizable     = true
        vSyncEnabled  = true
        foregroundFPS = 60
        backgroundFPS = 60
        useGL30       = false
        samples       = 4
        addIcon("icon16.png",  com.badlogic.gdx.Files.FileType.Internal)
        addIcon("icon32.png",  com.badlogic.gdx.Files.FileType.Internal)
        addIcon("icon128.png", com.badlogic.gdx.Files.FileType.Internal)
    }

    LwjglApplication(GameEngine(), config)
}
