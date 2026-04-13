package com.tanki.client.core

import com.badlogic.gdx.ApplicationAdapter
import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.GL20
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.badlogic.gdx.math.Matrix4
import com.tanki.client.gui.UIManager
import com.tanki.client.network.NetworkManager
import com.tanki.client.utils.FontGenerator
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class GameEngine : ApplicationAdapter(), KoinComponent {
    private val logger = LoggerFactory.getLogger(GameEngine::class.java)

    private val networkManager: NetworkManager by inject()
    private val uiManager: UIManager by inject()

    lateinit var batch: SpriteBatch
        private set
    lateinit var shapeRenderer: ShapeRenderer
        private set

    // Shared projection matrix: pixel-perfect, Y=0 at bottom
    private val projMatrix = Matrix4()
    
    // Track window size for resize detection
    private var lastWidth = 0
    private var lastHeight = 0

    override fun create() {
        logger.info("GameEngine create()")
        batch = SpriteBatch()
        shapeRenderer = ShapeRenderer()
        updateMatrix()
        FontGenerator.init()
        networkManager.initialize()
        uiManager.initialize()

        // Иконка окна через AWT (после инициализации LWJGL)
        try {
            val iconUrl = Thread.currentThread().contextClassLoader
                .getResource("init-tank-logo.png")
            if (iconUrl != null) {
                val img = javax.imageio.ImageIO.read(iconUrl)
                java.awt.Window.getWindows().forEach { w ->
                    (w as? java.awt.Frame)?.setIconImage(img)
                }
                try { java.awt.Taskbar.getTaskbar().setIconImage(img) } catch (_: Exception) {}
            }
        } catch (e: Exception) {
            logger.warn("Icon: ${e.message}")
        }
    }

    override fun render() {
        // Обновляем матрицу при изменении размера
        if (Gdx.graphics.width != lastWidth || Gdx.graphics.height != lastHeight) {
            updateMatrix()
            lastWidth = Gdx.graphics.width
            lastHeight = Gdx.graphics.height
            logger.info("Окно изменено до ${Gdx.graphics.width}x${Gdx.graphics.height}")
        }
        
        Gdx.gl.glClearColor(0f, 0f, 0f, 1f)
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT)
        Gdx.gl.glEnable(GL20.GL_BLEND)
        Gdx.gl.glBlendFunc(GL20.GL_SRC_ALPHA, GL20.GL_ONE_MINUS_SRC_ALPHA)

        batch.projectionMatrix = projMatrix
        shapeRenderer.projectionMatrix = projMatrix

        networkManager.update()
        
        uiManager.render(batch, shapeRenderer)
    }

    override fun resize(width: Int, height: Int) {
        updateMatrix()
        uiManager.resize(width, height)
    }

    private fun updateMatrix() {
        val w = Gdx.graphics.width.toFloat()
        val h = Gdx.graphics.height.toFloat()
        // setToOrtho2D: left=0, bottom=0, width=w, height=h  →  Y=0 at bottom, pixels
        projMatrix.setToOrtho2D(0f, 0f, w, h)
    }

    override fun dispose() {
        batch.dispose()
        shapeRenderer.dispose()
        FontGenerator.dispose()
        uiManager.dispose()
        networkManager.dispose()
        logger.info("GameEngine disposed")
    }
}
