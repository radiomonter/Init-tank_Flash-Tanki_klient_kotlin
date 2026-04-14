package com.tanki.client.utils

import com.badlogic.gdx.graphics.Texture
import com.badlogic.gdx.graphics.g2d.SpriteBatch

/**
 * Рисует 3-slice (left + tiled center + right) горизонтальный виджет.
 * left/right — фиксированные края, center — растягивается.
 */
object NineSlice {

    fun draw3H(
        batch: SpriteBatch,
        left: Texture?, center: Texture?, right: Texture?,
        x: Float, y: Float, w: Float, h: Float
    ) {
        val lw = if (left  != null) h * left.width.toFloat()  / left.height.toFloat()  else 0f
        val rw = if (right != null) h * right.width.toFloat() / right.height.toFloat() else 0f
        val cw = w - lw - rw

        if (left   != null && lw > 0) batch.draw(left,   x,          y, lw, h)
        if (center != null && cw > 0) batch.draw(center, x + lw,     y, cw, h)
        if (right  != null && rw > 0) batch.draw(right,  x + lw + cw, y, rw, h)
    }
}
