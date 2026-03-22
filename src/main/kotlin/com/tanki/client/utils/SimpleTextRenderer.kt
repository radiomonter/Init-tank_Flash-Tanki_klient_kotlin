package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import org.slf4j.LoggerFactory

object SimpleTextRenderer {
    
    private val logger = LoggerFactory.getLogger("SimpleTextRenderer")
    
    // Simple character patterns using rectangles
    private fun drawChar(batch: SpriteBatch?, shapeRenderer: ShapeRenderer, char: Char, x: Float, y: Float, size: Float, color: Color) {
        when (char.uppercaseChar()) {
            'A' -> drawLetterA(shapeRenderer, x, y, size, color)
            'B' -> drawLetterB(shapeRenderer, x, y, size, color)
            'C' -> drawLetterC(shapeRenderer, x, y, size, color)
            'D' -> drawLetterD(shapeRenderer, x, y, size, color)
            'E' -> drawLetterE(shapeRenderer, x, y, size, color)
            'F' -> drawLetterF(shapeRenderer, x, y, size, color)
            'G' -> drawLetterG(shapeRenderer, x, y, size, color)
            'H' -> drawLetterH(shapeRenderer, x, y, size, color)
            'I' -> drawLetterI(shapeRenderer, x, y, size, color)
            'J' -> drawLetterJ(shapeRenderer, x, y, size, color)
            'K' -> drawLetterK(shapeRenderer, x, y, size, color)
            'L' -> drawLetterL(shapeRenderer, x, y, size, color)
            'M' -> drawLetterM(shapeRenderer, x, y, size, color)
            'N' -> drawLetterN(shapeRenderer, x, y, size, color)
            'O' -> drawLetterO(shapeRenderer, x, y, size, color)
            'P' -> drawLetterP(shapeRenderer, x, y, size, color)
            'Q' -> drawLetterQ(shapeRenderer, x, y, size, color)
            'R' -> drawLetterR(shapeRenderer, x, y, size, color)
            'S' -> drawLetterS(shapeRenderer, x, y, size, color)
            'T' -> drawLetterT(shapeRenderer, x, y, size, color)
            'U' -> drawLetterU(shapeRenderer, x, y, size, color)
            'V' -> drawLetterV(shapeRenderer, x, y, size, color)
            'W' -> drawLetterW(shapeRenderer, x, y, size, color)
            'X' -> drawLetterX(shapeRenderer, x, y, size, color)
            'Y' -> drawLetterY(shapeRenderer, x, y, size, color)
            'Z' -> drawLetterZ(shapeRenderer, x, y, size, color)
            ' ' -> {} // Space
            else -> drawLetterO(shapeRenderer, x, y, size, color) // Default to O for unknown chars
        }
    }
    
    private fun drawLetterA(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left leg
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Right leg  
        shapeRenderer.rect(x + size * 0.8f, y, size * 0.2f, size)
        // Cross bar
        shapeRenderer.rect(x, y + size * 0.5f, size, size * 0.15f)
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
    }
    
    private fun drawLetterB(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Top bar
        shapeRenderer.rect(x, y + size * 0.85f, size * 0.8f, size * 0.15f)
        // Middle bar
        shapeRenderer.rect(x, y + size * 0.5f, size * 0.8f, size * 0.15f)
        // Bottom bar
        shapeRenderer.rect(x, y, size * 0.8f, size * 0.15f)
        // Right curve (simplified)
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.15f, size * 0.2f, size * 0.35f)
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.65f, size * 0.2f, size * 0.2f)
    }
    
    private fun drawLetterC(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size * 0.8f, size * 0.15f)
        // Left
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Bottom
        shapeRenderer.rect(x, y, size * 0.8f, size * 0.15f)
    }
    
    private fun drawLetterD(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size * 0.8f, size * 0.15f)
        // Bottom
        shapeRenderer.rect(x, y, size * 0.8f, size * 0.15f)
        // Right curve
        shapeRenderer.rect(x + size * 0.6f, y, size * 0.2f, size)
    }
    
    private fun drawLetterE(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Middle
        shapeRenderer.rect(x, y + size * 0.5f, size * 0.8f, size * 0.15f)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    private fun drawLetterF(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Middle
        shapeRenderer.rect(x, y + size * 0.5f, size * 0.8f, size * 0.15f)
    }
    
    private fun drawLetterG(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size * 0.8f, size * 0.15f)
        // Left
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Bottom
        shapeRenderer.rect(x, y, size * 0.8f, size * 0.15f)
        // Right extension
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.3f, size * 0.2f, size * 0.2f)
        shapeRenderer.rect(x + size * 0.4f, y + size * 0.3f, size * 0.4f, size * 0.15f)
    }
    
    private fun drawLetterH(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Right bar
        shapeRenderer.rect(x + size * 0.8f, y, size * 0.2f, size)
        // Cross bar
        shapeRenderer.rect(x, y + size * 0.5f, size, size * 0.15f)
    }
    
    private fun drawLetterI(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x + size * 0.4f, y, size * 0.2f, size)
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    private fun drawLetterJ(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.85f, size * 0.6f, size * 0.15f)
        // Vertical bar
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.3f, size * 0.2f, size * 0.55f)
        // Bottom curve
        shapeRenderer.rect(x + size * 0.2f, y, size * 0.6f, size * 0.15f)
        shapeRenderer.rect(x + size * 0.2f, y, size * 0.2f, size * 0.3f)
    }
    
    private fun drawLetterK(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Upper diagonal
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.5f, size * 0.6f, size * 0.15f)
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.5f, size * 0.15f, size * 0.35f)
        // Lower diagonal
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.15f, size * 0.4f, size * 0.15f)
        shapeRenderer.rect(x + size * 0.4f, y + size * 0.15f, size * 0.15f, size * 0.35f)
    }
    
    private fun drawLetterL(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    private fun drawLetterM(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Right bar
        shapeRenderer.rect(x + size * 0.8f, y, size * 0.2f, size)
        // Left diagonal
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.5f, size * 0.3f, size * 0.15f)
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.15f, size * 0.15f, size * 0.35f)
        // Right diagonal
        shapeRenderer.rect(x + size * 0.5f, y + size * 0.5f, size * 0.3f, size * 0.15f)
        shapeRenderer.rect(x + size * 0.65f, y + size * 0.15f, size * 0.15f, size * 0.35f)
    }
    
    private fun drawLetterN(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Right bar
        shapeRenderer.rect(x + size * 0.8f, y, size * 0.2f, size)
        // Diagonal
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.7f, size * 0.6f, size * 0.15f)
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.15f, size * 0.15f, size * 0.55f)
    }
    
    private fun drawLetterO(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Left
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Right
        shapeRenderer.rect(x + size * 0.8f, y, size * 0.2f, size)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    private fun drawLetterP(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Vertical bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size * 0.8f, size * 0.15f)
        // Middle
        shapeRenderer.rect(x, y + size * 0.5f, size * 0.8f, size * 0.15f)
    }
    
    private fun drawLetterQ(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        drawLetterO(shapeRenderer, x, y, size, color)
        // Tail
        shapeRenderer.rect(x + size * 0.6f, y - size * 0.1f, size * 0.15f, size * 0.25f)
        shapeRenderer.rect(x + size * 0.6f, y - size * 0.1f, size * 0.3f, size * 0.15f)
    }
    
    private fun drawLetterR(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        drawLetterP(shapeRenderer, x, y, size, color)
        // Leg
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.15f, size * 0.15f, size * 0.35f)
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.15f, size * 0.4f, size * 0.15f)
    }
    
    private fun drawLetterS(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Upper left
        shapeRenderer.rect(x, y + size * 0.7f, size * 0.2f, size * 0.15f)
        // Middle
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.5f, size * 0.6f, size * 0.15f)
        // Lower right
        shapeRenderer.rect(x + size * 0.8f, y + size * 0.3f, size * 0.2f, size * 0.15f)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    private fun drawLetterT(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Vertical bar
        shapeRenderer.rect(x + size * 0.4f, y, size * 0.2f, size)
    }
    
    private fun drawLetterU(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left bar
        shapeRenderer.rect(x, y + size * 0.15f, size * 0.2f, size * 0.85f)
        // Right bar
        shapeRenderer.rect(x + size * 0.8f, y + size * 0.15f, size * 0.2f, size * 0.85f)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    private fun drawLetterV(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left diagonal
        shapeRenderer.rect(x, y + size * 0.5f, size * 0.15f, size * 0.5f)
        shapeRenderer.rect(x + size * 0.15f, y, size * 0.3f, size * 0.15f)
        // Right diagonal
        shapeRenderer.rect(x + size * 0.85f, y + size * 0.5f, size * 0.15f, size * 0.5f)
        shapeRenderer.rect(x + size * 0.55f, y, size * 0.3f, size * 0.15f)
        // Bottom point
        shapeRenderer.rect(x + size * 0.4f, y, size * 0.2f, size * 0.15f)
    }
    
    private fun drawLetterW(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left bar
        shapeRenderer.rect(x, y, size * 0.2f, size)
        // Right bar
        shapeRenderer.rect(x + size * 0.8f, y, size * 0.2f, size)
        // Left V
        shapeRenderer.rect(x + size * 0.2f, y + size * 0.5f, size * 0.15f, size * 0.5f)
        shapeRenderer.rect(x + size * 0.35f, y, size * 0.15f, size * 0.15f)
        // Right V
        shapeRenderer.rect(x + size * 0.65f, y + size * 0.5f, size * 0.15f, size * 0.5f)
        shapeRenderer.rect(x + size * 0.5f, y, size * 0.15f, size * 0.15f)
    }
    
    private fun drawLetterX(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Left diagonal
        shapeRenderer.rect(x, y + size * 0.8f, size * 0.15f, size * 0.8f)
        shapeRenderer.rect(x + size * 0.15f, y, size * 0.7f, size * 0.15f)
        // Right diagonal
        shapeRenderer.rect(x + size * 0.85f, y + size * 0.8f, size * 0.15f, size * 0.8f)
        shapeRenderer.rect(x + size * 0.15f, y + size * 0.85f, size * 0.7f, size * 0.15f)
    }
    
    private fun drawLetterY(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Upper left diagonal
        shapeRenderer.rect(x, y + size * 0.6f, size * 0.15f, size * 0.4f)
        shapeRenderer.rect(x + size * 0.15f, y + size * 0.4f, size * 0.25f, size * 0.15f)
        // Upper right diagonal
        shapeRenderer.rect(x + size * 0.85f, y + size * 0.6f, size * 0.15f, size * 0.4f)
        shapeRenderer.rect(x + size * 0.6f, y + size * 0.4f, size * 0.25f, size * 0.15f)
        // Vertical bar
        shapeRenderer.rect(x + size * 0.4f, y, size * 0.2f, size * 0.4f)
    }
    
    private fun drawLetterZ(shapeRenderer: ShapeRenderer, x: Float, y: Float, size: Float, color: Color) {
        shapeRenderer.color = color
        // Top
        shapeRenderer.rect(x, y + size * 0.85f, size, size * 0.15f)
        // Diagonal
        shapeRenderer.rect(x, y + size * 0.7f, size * 0.15f, size * 0.7f)
        shapeRenderer.rect(x + size * 0.15f, y + size * 0.15f, size * 0.7f, size * 0.15f)
        // Bottom
        shapeRenderer.rect(x, y, size, size * 0.15f)
    }
    
    fun drawText(shapeRenderer: ShapeRenderer, text: String, x: Float, y: Float, size: Float, color: Color) {
        var currentX = x
        for (char in text) {
            drawChar(null, shapeRenderer, char, currentX, y, size, color)
            currentX += size * 1.2f // Character spacing
        }
    }
    
    fun drawButtonText(shapeRenderer: ShapeRenderer, text: String, x: Float, y: Float, width: Float, height: Float, color: Color) {
        val charSize = height * 0.6f
        val textWidth = text.length * charSize * 1.2f
        val startX = x + (width - textWidth) / 2f
        val startY = y + (height - charSize) / 2f
        
        shapeRenderer.begin(ShapeRenderer.ShapeType.Filled)
        drawText(shapeRenderer, text, startX, startY, charSize, color)
        shapeRenderer.end()
    }
}
