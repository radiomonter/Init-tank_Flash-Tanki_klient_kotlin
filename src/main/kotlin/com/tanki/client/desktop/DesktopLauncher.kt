package com.tanki.client.desktop

import com.badlogic.gdx.backends.lwjgl.LwjglApplication
import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration
import com.tanki.client.core.GameEngine

object DesktopLauncher {
    @JvmStatic
    fun main(arg: Array<String>) {
        val config = LwjglApplicationConfiguration()
        
        // Window settings
        config.title = "Tanki Client - Kotlin"
        config.width = 1024
        config.height = 768
        config.resizable = false
        config.vSyncEnabled = true
        config.foregroundFPS = 60
        config.backgroundFPS = 60
        
        // OpenGL settings
        config.useGL30 = false
        config.samples = 4 // Anti-aliasing
        
        // Window icon (optional)
        // config.addIcon("icon.png", Files.FileType.Internal)
        
        LwjglApplication(GameEngine(), config)
    }
}
