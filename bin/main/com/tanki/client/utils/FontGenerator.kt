package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator.FreeTypeFontParameter
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.Texture.TextureFilter
import org.slf4j.LoggerFactory

object FontGenerator {
    private val logger = LoggerFactory.getLogger(FontGenerator::class.java)
    private lateinit var roboto: FreeTypeFontGenerator
    private lateinit var arial: FreeTypeFontGenerator

    fun init() {
        val robotoFile = Gdx.files.internal("fonts/Roboto-Regular.ttf")
        val arialFile = Gdx.files.internal("fonts/arial.ttf")
        
        roboto = FreeTypeFontGenerator(robotoFile)
        arial = FreeTypeFontGenerator(arialFile)
        logger.info("Шрифты загружены: Roboto + Arial")
    }

    private val fontCache = mutableMapOf<Pair<Int, FontType>, BitmapFont>()
    
    fun makeFont(size: Int, fontType: FontType = FontType.ROBOTO): BitmapFont {
        val key = size to fontType
        return fontCache.getOrPut(key) {
            val generator = when (fontType) {
                FontType.ROBOTO -> roboto
                FontType.ARIAL -> arial
            }

            val parameter = FreeTypeFontParameter()
            parameter.size = size
            parameter.color = Color.WHITE
            parameter.genMipMaps = true
            parameter.magFilter = TextureFilter.Linear
            parameter.minFilter = TextureFilter.Linear
            parameter.incremental = true
            
            // ✅ КИРИЛЛИЦА ПОЛНАЯ
            parameter.characters = " 0123456789абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ.,!?():;\"'-№%★€$+-=/\\@"
            
            generator.generateFont(parameter)
        }
    }

    fun dispose() {
        roboto.dispose()
        arial.dispose()
        fontCache.values.forEach { it.dispose() }
        fontCache.clear()
    }
}

enum class FontType {
    ROBOTO, ARIAL
}

