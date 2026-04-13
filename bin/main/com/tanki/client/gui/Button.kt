package com.tanki.client.gui

import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer

enum class ButtonStyle { DEFAULT, ACCENT, GREEN }

class Button(
    var x: Float,
    var y: Float,
    val width: Float,
    val height: Float,
    val text: String,
    val onClick: () -> Unit,
    val accent: Boolean = false,
    val style: ButtonStyle = if (accent) ButtonStyle.ACCENT else ButtonStyle.DEFAULT
) {
    // Flash client button colors with enhanced styling
    private val FLASH_NORMAL_FILL = Color(0.15f, 0.15f, 0.18f, 1f)
    private val FLASH_NORMAL_BORDER = Color(0.05f, 0.85f, 0.85f, 1f) // Bright Flash orange
    private val FLASH_NORMAL_TEXT = Color(0.9f, 0.9f, 0.9f, 1f)
    
    private val FLASH_ACCENT_FILL = Color(0.25f, 0.12f, 0.08f, 1f) // Darker orange
    private val FLASH_ACCENT_BORDER = Color(1f, 0.7f, 0.1f, 1f) // Bright orange-yellow
    private val FLASH_ACCENT_TEXT = Color.WHITE
    
    private val FLASH_GREEN_FILL = Color(0.15f, 0.65f, 0.15f, 1f) // Brighter green
    private val FLASH_GREEN_BORDER = Color(0.25f, 0.85f, 0.25f, 1f) // Brighter green border
    private val FLASH_GREEN_TEXT = Color(0.95f, 1.00f, 0.95f, 1f)

    fun fillColor() = when (style) {
        ButtonStyle.GREEN   -> FLASH_GREEN_FILL
        ButtonStyle.ACCENT  -> FLASH_ACCENT_FILL
        ButtonStyle.DEFAULT -> FLASH_NORMAL_FILL
    }
    
    fun borderColor() = when (style) {
        ButtonStyle.GREEN   -> FLASH_GREEN_BORDER
        ButtonStyle.ACCENT  -> FLASH_ACCENT_BORDER
        ButtonStyle.DEFAULT -> FLASH_NORMAL_BORDER
    }
    
    fun textColor() = when (style) {
        ButtonStyle.GREEN   -> FLASH_GREEN_TEXT
        ButtonStyle.ACCENT  -> FLASH_ACCENT_TEXT
        ButtonStyle.DEFAULT -> FLASH_NORMAL_TEXT
    }

    /** Call inside sr.begin(Filled) block */
    fun drawFill(sr: ShapeRenderer) {
        // Shadow effect
        sr.color = Color(0f, 0f, 0f, 0.3f)
        sr.rect(x + 2f, y - 2f, width, height)
        
        // Main fill
        sr.color = fillColor()
        sr.rect(x, y, width, height)
        
        // Inner highlight
        sr.color = Color(1f, 1f, 1f, 0.1f)
        sr.rect(x + 1f, y + 1f, width - 2f, height - 2f)
    }

    /** Call inside sr.begin(Line) block */
    fun drawBorder(sr: ShapeRenderer) {
        sr.color = borderColor()
        sr.rect(x, y, width, height)
        
        // Inner border highlight
        sr.color = Color(1f, 1f, 1f, 0.2f)
        sr.rect(x + 1f, y + 1f, width - 2f, height - 2f)
    }

/** Call inside batch.begin() block. */
    fun drawText(batch: SpriteBatch, font: BitmapFont) {
        val layout = GlyphLayout(font, text)
        val textX = x + (width - layout.width) / 2f
        val textY = y + (height + layout.height) / 2f
        
        // Shadow effect for text
        font.color = Color(0f, 0f, 0f, 0.5f)
        font.draw(batch, text, textX + 1f, textY - 1f)
        
        // Main text
        font.color = textColor()
        font.draw(batch, text, textX, textY)
    }

    fun checkClick(mouseX: Float, mouseY: Float): Boolean {
        if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
            onClick()
            return true
        }
        return false
    }
}
