package com.tanki.client.utils

import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.tanki.client.utils.FontGenerator
import com.badlogic.gdx.graphics.Color

fun makeFont(size: Int): BitmapFont {
    return FontGenerator.makeFont(size)
}
