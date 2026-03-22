package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator

// Latin + Cyrillic glyph set
private val CHARS = FreeTypeFontGenerator.DEFAULT_CHARS +
    "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя"

fun makeFont(sizePx: Int, color: Color = Color.WHITE): BitmapFont {
    val gen = FreeTypeFontGenerator(Gdx.files.internal("fonts/arial.ttf"))
    val param = FreeTypeFontGenerator.FreeTypeFontParameter().apply {
        size = sizePx
        characters = CHARS
        this.color = color
        minFilter = com.badlogic.gdx.graphics.Texture.TextureFilter.Linear
        magFilter = com.badlogic.gdx.graphics.Texture.TextureFilter.Linear
    }
    val font = gen.generateFont(param)
    gen.dispose()
    return font
}
