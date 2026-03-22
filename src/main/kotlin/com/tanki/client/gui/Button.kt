package com.tanki.client.gui

import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer

enum class ButtonStyle { DEFAULT, ACCENT, GREEN }

class Button(
    val x: Float,
    val y: Float,
    val width: Float,
    val height: Float,
    val text: String,
    val onClick: () -> Unit,
    val accent: Boolean = false,
    val style: ButtonStyle = if (accent) ButtonStyle.ACCENT else ButtonStyle.DEFAULT
) {
    private val GREEN_FILL   = Color(0.13f, 0.55f, 0.13f, 1f)
    private val GREEN_BORDER = Color(0.20f, 0.75f, 0.20f, 1f)
    private val GREEN_TEXT   = Color(0.85f, 1.00f, 0.85f, 1f)

    fun fillColor() = when (style) {
        ButtonStyle.GREEN   -> GREEN_FILL
        ButtonStyle.ACCENT  -> TankiStyle.ORANGE_DARK
        ButtonStyle.DEFAULT -> TankiStyle.BTN_NORMAL
    }

    fun borderColor() = when (style) {
        ButtonStyle.GREEN   -> GREEN_BORDER
        ButtonStyle.ACCENT  -> TankiStyle.ORANGE
        ButtonStyle.DEFAULT -> TankiStyle.BORDER
    }

    fun textColor() = when (style) {
        ButtonStyle.GREEN   -> GREEN_TEXT
        ButtonStyle.ACCENT  -> TankiStyle.ORANGE_GLOW
        ButtonStyle.DEFAULT -> TankiStyle.TEXT_WHITE
    }

    /** Call inside sr.begin(Filled) block */
    fun drawFill(sr: ShapeRenderer) {
        sr.color = fillColor()
        sr.rect(x, y, width, height)
    }

    /** Call inside sr.begin(Line) block */
    fun drawBorder(sr: ShapeRenderer) {
        sr.color = borderColor()
        sr.rect(x, y, width, height)
    }

    /** Call inside batch.begin() block. Font must be created before batch.begin(). */
    fun drawText(batch: SpriteBatch, font: BitmapFont) {
        font.color = textColor()
        val layout = GlyphLayout(font, text)
        font.draw(batch, text, x + (width - layout.width) / 2f, y + (height + layout.height) / 2f)
    }

    fun checkClick(mouseX: Float, mouseY: Float) {
        if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) onClick()
    }
}
