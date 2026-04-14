package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Texture
import org.slf4j.LoggerFactory

object UITextures {

    private val logger = LoggerFactory.getLogger("UITextures")
    private val cache  = mutableMapOf<String, Texture?>()

    fun get(name: String): Texture? = cache.getOrPut(name) {
        try {
            val t = Texture(Gdx.files.internal("ui/$name"))
            t.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear)
            t
        } catch (e: Exception) {
            logger.warn("UITexture not found: ui/$name")
            null
        }
    }

    // Удобные геттеры
    val xpBarLeft:    Texture? get() = get("xp_bar_left.png")
    val xpBarRight:   Texture? get() = get("xp_bar_right.png")
    val xpBgLeft:     Texture? get() = get("xp_bg_left.png")
    val xpBgRight:    Texture? get() = get("xp_bg_right.png")
    val crystalIcon:  Texture? get() = get("crystal_icon.png")
    val crystalBig:   Texture? get() = get("crystal_big.png")
    val crystalSmall: Texture? get() = get("crystal_small.png")
    val panelBg:      Texture? get() = get("panel_bg.png")

    // 3-slice металлическая рамка (InputLeft/Center/Right, 5x30 / 1x30 / 5x30)
    val frameLeft:   Texture? get() = get("frame_left.png")
    val frameCenter: Texture? get() = get("frame_center.png")
    val frameRight:  Texture? get() = get("frame_right.png")
    val xpFrameLeft:   Texture? get() = get("xp_frame_left.png")
    val xpFrameRight:  Texture? get() = get("xp_frame_right.png")
    // 3-slice заполнение
    val xpFillLeft:    Texture? get() = get("xp_fill_left.png")
    val xpFillRight:   Texture? get() = get("xp_fill_right.png")
    // Тень/оверлей
    val xpShadowLeft:  Texture? get() = get("xp_shadow_left.png")
    val xpShadowRight: Texture? get() = get("xp_shadow_right.png")
    val xpShadowMid:   Texture? get() = get("xp_shadow_mid.png")

    fun dispose() {
        cache.values.filterNotNull().forEach { it.dispose() }
        cache.clear()
    }
}
