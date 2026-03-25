package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator
import org.slf4j.LoggerFactory

object FontGenerator {
    
    private val logger = LoggerFactory.getLogger("FontGenerator")
    
    private var defaultFont: BitmapFont? = null
    private var generator: FreeTypeFontGenerator? = null
    
    init {
        // Try to load Roboto font first, then fallback to system fonts
        try {
            val robotoPath = "fonts/Roboto-Regular.ttf"
            val fontFile = Gdx.files.internal(robotoPath)
            println("DEBUG: Checking Roboto font at: $robotoPath")
            println("DEBUG: Roboto font file exists: ${fontFile.exists()}")
            
            if (fontFile.exists()) {
                generator = FreeTypeFontGenerator(fontFile)
                logger.info("Successfully loaded Roboto font from: $robotoPath")
                println("DEBUG: Roboto font loaded successfully!")
            } else {
                println("DEBUG: Roboto font not found, trying system fonts...")
                loadSystemFonts()
            }
        } catch (e: Exception) {
            println("DEBUG: Exception loading Roboto: ${e.message}")
            println("DEBUG: Trying system fonts...")
            loadSystemFonts()
        }
    }
    
    private fun loadSystemFonts() {
        // Try to load multiple system fonts that look like Flash client fonts
        val fontPaths = listOf(
            "C:/Windows/Fonts/arial.ttf",           // Arial - standard
            "C:/Windows/Fonts/tahoma.ttf",          // Tahoma - Flash client uses this
            "C:/Windows/Fonts/verdana.ttf",         // Verdana - clean geometric
            "C:/Windows/Fonts/segoeui.ttf",         // Segoe UI - modern
            "C:/Windows/Fonts/calibri.ttf",         // Calibri - clean
            "C:/Windows/Fonts/times.ttf",            // Times New Roman - serif alternative
            "C:/Windows/Fonts/cour.ttf",             // Courier - monospace alternative
            "C:/Windows/Fonts/georgia.ttf"           // Georgia - serif
        )
        
        for (fontPath in fontPaths) {
            try {
                val fontFile = Gdx.files.absolute(fontPath)
                println("DEBUG: Checking system font at: $fontPath")
                println("DEBUG: Font file exists: ${fontFile.exists()}")
                
                if (fontFile.exists()) {
                    generator = FreeTypeFontGenerator(fontFile)
                    logger.info("Successfully loaded system font from: $fontPath")
                    println("DEBUG: System font loaded successfully from: $fontPath")
                    break
                }
            } catch (e: Exception) {
                println("DEBUG: Exception loading font $fontPath: ${e.message}")
            }
        }
        
        if (generator == null) {
            logger.warn("No fonts could be loaded, using BitmapFont fallback")
            println("DEBUG: No fonts loaded, using BitmapFont")
        }
    }
    
    fun getDefaultFont(): BitmapFont {
        if (defaultFont == null) {
            defaultFont = makeFont(12)
        }
        return defaultFont!!
    }
    
    fun makeFont(size: Int): BitmapFont {
        // Простой подход - используем Roboto в реальном размере, без трюков с масштабированием
        return if (generator != null) {
            try {
                val parameter = FreeTypeFontGenerator.FreeTypeFontParameter().apply {
                    this.size = size // РЕАЛЬНЫЙ РАЗМЕР - без масштабирования!
                    borderWidth = 0f
                    borderColor = Color.BLACK
                    color = Color.WHITE
                    
                    // Простая фильтрация
                    magFilter = com.badlogic.gdx.graphics.Texture.TextureFilter.Linear
                    minFilter = com.badlogic.gdx.graphics.Texture.TextureFilter.Linear
                    
                    // Базовые настройки
                    kerning = true
                    spaceX = 0
                    hinting = FreeTypeFontGenerator.Hinting.None // Без проблем с хинтингом
                    
                    // Все символы
                    characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя!?.,:-+@#$%&*()[]{}<>\\/|\"' "
                }
                val font = generator!!.generateFont(parameter)
                font.setUseIntegerPositions(false) // Позволяем быть плавным
                
                logger.info("Создан ПРОСТОЙ шрифт Roboto в реальном размере $size")
                font
            } catch (e: Exception) {
                logger.warn("Roboto не удалось, используем BitmapFont fallback", e)
                createSimpleBitmapFont(size)
            }
        } else {
            logger.info("Нет генератора, используем BitmapFont fallback")
            createSimpleBitmapFont(size)
        }
    }
    
    private fun createSimpleBitmapFont(size: Int): BitmapFont {
        return BitmapFont().apply {
            // Простое масштабирование - без трюков
            val scale = size / 12f // Масштаб относительно стандартного 12px
            data.setScale(scale)
            color = Color.WHITE
            setUseIntegerPositions(false) // Плавный рендеринг
            
            // Простая фильтрация
            region.texture.setFilter(com.badlogic.gdx.graphics.Texture.TextureFilter.Linear, 
                                     com.badlogic.gdx.graphics.Texture.TextureFilter.Linear)
            
            logger.info("Создан ПРОСТОЙ BitmapFont с масштабом $scale для размера $size")
        }
    }
    
    // Special font just for Latin text
    fun makeLatinFont(size: Int): BitmapFont {
        return if (generator != null) {
            try {
                val parameter = FreeTypeFontGenerator.FreeTypeFontParameter().apply {
                    this.size = size * 4 // Very large for best Latin quality
                    borderWidth = 0.3f // Add slight border for better definition
                    borderColor = Color.BLACK
                    color = Color.WHITE
                    
                    // Best quality for Latin
                    magFilter = com.badlogic.gdx.graphics.Texture.TextureFilter.MipMapLinearLinear
                    minFilter = com.badlogic.gdx.graphics.Texture.TextureFilter.MipMapLinearLinear
                    
                    kerning = true
                    spaceX = 0
                    gamma = 1.1f
                    hinting = FreeTypeFontGenerator.Hinting.Full
                    
                    // Only Latin characters
                    characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?.,:-+@#$%&*()[]{}<>\\/|\"' "
                }
                val font = generator!!.generateFont(parameter)
                font.setUseIntegerPositions(true)
                font.data.setScale(0.25f) // Scale down from 4x
                
                logger.info("Created SPECIALIZED Latin font with size $size")
                font
            } catch (e: Exception) {
                logger.warn("Latin font failed, using regular font", e)
                makeFont(size)
            }
        } else {
            makeFont(size)
        }
    }
    
    fun createScaledFont(scale: Float = 1.0f): BitmapFont {
        return BitmapFont().apply {
            data.setScale(scale)
            color = Color.WHITE
            setUseIntegerPositions(false)
        }
    }
    
    fun dispose() {
        defaultFont?.dispose()
        defaultFont = null
        generator?.dispose()
        generator = null
    }
}
