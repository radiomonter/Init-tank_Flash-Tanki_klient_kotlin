package com.tanki.client.utils

import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.GlyphLayout
import com.tanki.client.utils.FontGenerator
import org.slf4j.LoggerFactory

object SimpleTextRenderer {
    
    private val logger = LoggerFactory.getLogger("SimpleTextRenderer")
    
    fun drawText(batch: com.badlogic.gdx.graphics.g2d.SpriteBatch, text: String, x: Float, y: Float, size: Float, color: Color) {
        val font = FontGenerator.makeFont(size.toInt())
        font.color = color
        font.draw(batch, text, x, y)
        // НЕ dispose здесь - кэшируется в FontGenerator
    }
}
