package com.tanki.client.gui

import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer

/**
 * Text field widget. Caller must manage ShapeRenderer/SpriteBatch begin-end blocks.
 * drawBackground() — call inside sr.begin(Filled) block
 * drawBorder()     — call inside sr.begin(Line) block
 * drawText()       — call inside batch.begin() block
 */
class TextField(
    val x: Float,
    val y: Float,
    val width: Float,
    val height: Float,
    val hint: String = "",
    val isPassword: Boolean = false
) {
    fun contains(mx: Float, my: Float) =
        mx >= x && mx <= x + width && my >= y && my <= y + height

    fun drawBackground(sr: ShapeRenderer) {
        sr.color = Color(0.14f, 0.17f, 0.22f, 1f)
        sr.rect(x, y, width, height)
    }

    fun drawBorder(sr: ShapeRenderer, isActive: Boolean) {
        sr.color = if (isActive) TankiStyle.ORANGE else TankiStyle.BORDER
        sr.rect(x, y, width, height)
    }

    fun drawText(batch: SpriteBatch, font: BitmapFont, text: String) {
        if (text.isEmpty()) {
            font.color = TankiStyle.TEXT_GRAY
            font.draw(batch, hint, x + 10f, y + height * 0.65f)
        } else {
            font.color = TankiStyle.TEXT_WHITE
            val display = if (isPassword) "*".repeat(text.length) else text
            font.draw(batch, display, x + 10f, y + height * 0.65f)
        }
    }
}
