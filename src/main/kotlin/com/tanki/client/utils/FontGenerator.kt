package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import org.slf4j.LoggerFactory

object FontGenerator {
    
    private val logger = LoggerFactory.getLogger("FontGenerator")
    
    private var defaultFont: BitmapFont? = null
    
    fun getDefaultFont(): BitmapFont {
        if (defaultFont == null) {
            try {
                // Create a basic font with larger scale
                defaultFont = BitmapFont().apply {
                    data.setScale(2.0f) // Увеличенный размер для лучшей видимости
                    color = Color.WHITE
                }
                logger.info("Default font created successfully")
            } catch (e: Exception) {
                logger.error("Failed to create default font", e)
                // Fallback to basic font
                defaultFont = BitmapFont()
            }
        }
        return defaultFont!!
    }
    
    fun createScaledFont(scale: Float = 1.0f): BitmapFont {
        return BitmapFont().apply {
            data.setScale(scale)
            color = Color.WHITE
        }
    }
    
    fun dispose() {
        defaultFont?.dispose()
        defaultFont = null
    }
}
