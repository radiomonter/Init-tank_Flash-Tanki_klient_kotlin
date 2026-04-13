package com.tanki.client.utils

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Texture
import org.slf4j.LoggerFactory

object RankTextures {

    private val logger = LoggerFactory.getLogger("RankTextures")
    private val cache = mutableMapOf<String, Texture>()

    /** Возвращает текстуру ранга. premium=true — папка ranks/premium/ */
    fun get(rank: Int, premium: Boolean = false): Texture? {
        val key = if (premium) "premium/$rank" else "$rank"
        return cache.getOrPut(key) {
            val path = if (premium) "ranks/premium/Rank$rank.png" else "ranks/Rank$rank.png"
            try {
                val t = Texture(Gdx.files.internal(path))
                t.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear)
                t
            } catch (e: Exception) {
                logger.warn("Rank texture not found: $path")
                // fallback — обычный ранг
                if (premium) get(rank, false) ?: return null
                else return null
            }
        }
    }

    fun dispose() {
        cache.values.forEach { it.dispose() }
        cache.clear()
    }
}
