package com.tanki.client.gui

import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer

abstract class UIScreen {

    protected var isVisible = false

    open fun show() { isVisible = true }
    open fun hide() { isVisible = false }

    abstract fun render(batch: SpriteBatch, sr: ShapeRenderer)

    open fun resize(width: Int, height: Int) {}
    open fun dispose() {}

    fun isScreenVisible(): Boolean = isVisible
}
