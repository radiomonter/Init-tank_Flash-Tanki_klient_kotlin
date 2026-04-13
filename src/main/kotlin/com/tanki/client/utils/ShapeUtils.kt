package com.tanki.client.utils

import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import kotlin.math.cos
import kotlin.math.sin

/**
 * Рисует закруглённый прямоугольник через треугольники (Filled) или линии (Line).
 * r — радиус угла, segments — количество сегментов дуги (8-12 достаточно).
 */
object ShapeUtils {

    fun filledRoundRect(sr: ShapeRenderer, x: Float, y: Float, w: Float, h: Float, r: Float, seg: Int = 10) {
        val r2 = r.coerceAtMost(w / 2f).coerceAtMost(h / 2f)
        // Центральный прямоугольник
        sr.rect(x + r2, y, w - r2 * 2, h)
        // Боковые полосы
        sr.rect(x, y + r2, r2, h - r2 * 2)
        sr.rect(x + w - r2, y + r2, r2, h - r2 * 2)
        // Углы
        corner(sr, x + r2,       y + r2,       r2, seg, 180f)
        corner(sr, x + w - r2,   y + r2,       r2, seg, 270f)
        corner(sr, x + w - r2,   y + h - r2,   r2, seg, 0f)
        corner(sr, x + r2,       y + h - r2,   r2, seg, 90f)
    }

    fun lineRoundRect(sr: ShapeRenderer, x: Float, y: Float, w: Float, h: Float, r: Float, seg: Int = 10) {
        val r2 = r.coerceAtMost(w / 2f).coerceAtMost(h / 2f)
        // Прямые стороны
        sr.line(x + r2, y,         x + w - r2, y)
        sr.line(x + r2, y + h,     x + w - r2, y + h)
        sr.line(x,      y + r2,    x,           y + h - r2)
        sr.line(x + w,  y + r2,    x + w,       y + h - r2)
        // Дуги углов
        arc(sr, x + r2,     y + r2,     r2, seg, 180f)
        arc(sr, x + w - r2, y + r2,     r2, seg, 270f)
        arc(sr, x + w - r2, y + h - r2, r2, seg, 0f)
        arc(sr, x + r2,     y + h - r2, r2, seg, 90f)
    }

    private fun corner(sr: ShapeRenderer, cx: Float, cy: Float, r: Float, seg: Int, startDeg: Float) {
        val step = 90f / seg
        for (i in 0 until seg) {
            val a1 = Math.toRadians((startDeg + i * step).toDouble())
            val a2 = Math.toRadians((startDeg + (i + 1) * step).toDouble())
            sr.triangle(
                cx, cy,
                cx + (cos(a1) * r).toFloat(), cy + (sin(a1) * r).toFloat(),
                cx + (cos(a2) * r).toFloat(), cy + (sin(a2) * r).toFloat()
            )
        }
    }

    private fun arc(sr: ShapeRenderer, cx: Float, cy: Float, r: Float, seg: Int, startDeg: Float) {
        val step = 90f / seg
        for (i in 0 until seg) {
            val a1 = Math.toRadians((startDeg + i * step).toDouble())
            val a2 = Math.toRadians((startDeg + (i + 1) * step).toDouble())
            sr.line(
                cx + (cos(a1) * r).toFloat(), cy + (sin(a1) * r).toFloat(),
                cx + (cos(a2) * r).toFloat(), cy + (sin(a2) * r).toFloat()
            )
        }
    }
}
