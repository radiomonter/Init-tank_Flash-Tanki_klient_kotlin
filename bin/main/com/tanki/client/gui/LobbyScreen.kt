package com.tanki.client.gui

import com.badlogic.gdx.Gdx
import com.badlogic.gdx.graphics.Color
import com.badlogic.gdx.graphics.g2d.BitmapFont
import com.badlogic.gdx.graphics.g2d.SpriteBatch
import com.badlogic.gdx.graphics.glutils.ShapeRenderer
import com.tanki.client.network.NetworkManager
import com.tanki.client.utils.SimpleTextRenderer
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.slf4j.LoggerFactory

class LobbyScreen : UIScreen(), KoinComponent {
    
    private val logger = LoggerFactory.getLogger("LobbyScreen")
    private val uiManager: UIManager by inject()
    private val networkManager: NetworkManager by inject()
    
    private lateinit var font: BitmapFont
    private lateinit var shapeRenderer: ShapeRenderer
    private var backButton: Button? = null
    
    // Battle list data
    private val battles = mutableListOf<BattleInfo>()
    private var scrollOffset = 0f
    private var selectedBattleIndex = -1
    
    data class BattleInfo(
        val id: String,
        val name: String,
        val mode: String,
        val map: String,
        val users: Int,
        val maxPeople: Int,
        val minRank: Int,
        val maxRank: Int
    )
    
    override fun show() {
        super.show()
        logger.info("Showing lobby screen")
        
        font = BitmapFont()
        shapeRenderer = ShapeRenderer()
        
        // Initialize UI elements
        initializeUI()
        
        // Load battle list
        loadBattleList()
    }
    
    private fun initializeUI() {
        val backButtonWidth = 100f
        val backButtonHeight = 40f
        val backButtonX = 20f
        val backButtonY = Gdx.graphics.height - 60f
        
        backButton = Button(
            x = backButtonX,
            y = backButtonY,
            width = backButtonWidth,
            height = backButtonHeight,
            text = "НАЗАД",
            onClick = { 
                logger.info("Back button clicked")
                uiManager.showScreen(ScreenType.MAIN_MENU)
            }
        )
        
        // Initialize mock battles for testing
        initializeMockBattles()
    }
    
    private fun initializeMockBattles() {
        battles.clear()
        battles.addAll(listOf(
            BattleInfo("1", "DEATHMATCH", "DM", "SAND VALLEY", 8, 10, 1, 5),
            BattleInfo("2", "TEAM DEATHMATCH", "TDM", "INDUSTRIAL ZONE", 12, 16, 3, 8),
            BattleInfo("3", "CAPTURE THE FLAG", "CTF", "MOUNTAIN PASS", 6, 8, 5, 10),
            BattleInfo("4", "PRO BATTLE", "DM", "SPACE STATION", 15, 20, 10, 15),
            BattleInfo("5", "NOOBS ONLY", "DM", "TRAINING GROUND", 4, 8, 1, 3)
        ))
    }
    
    private fun loadBattleList() {
        // In real implementation, this would load from server
        logger.info("Loading battle list...")
        // For now, we use mock data
    }
    
    override fun render(batch: SpriteBatch, sr: ShapeRenderer) {
        if (!isScreenVisible()) return
        
        // Draw background
        sr.begin(ShapeRenderer.ShapeType.Filled)
        sr.color = Color(0.1f, 0.08f, 0.15f, 1f) // Tanki dark background
        sr.rect(0f, 0f, Gdx.graphics.width.toFloat(), Gdx.graphics.height.toFloat())
        
        // Draw header background with Tanki orange accent
        sr.color = Color(0.95f, 0.55f, 0.0f, 1f) // Tanki orange
        sr.rect(0f, Gdx.graphics.height - 80f, Gdx.graphics.width.toFloat(), 4f)
        sr.color = Color(0.15f, 0.12f, 0.2f, 1f) // Header background
        sr.rect(0f, Gdx.graphics.height - 80f, Gdx.graphics.width.toFloat(), 80f)
        sr.end()
        
        // Draw title
        batch.begin()
        SimpleTextRenderer.drawText(batch, "СПИСОК БОЁВ", Gdx.graphics.width / 2f - 60f, Gdx.graphics.height - 30f, 24f, Color(0.95f, 0.55f, 0.0f, 1f))
        batch.end()
        
        // Draw back button
        backButton?.let { button ->
            sr.begin(ShapeRenderer.ShapeType.Filled)
            button.drawFill(sr)
            sr.end()
            
            sr.begin(ShapeRenderer.ShapeType.Line)
            button.drawBorder(sr)
            sr.end()
            
            batch.begin()
            val font = BitmapFont()
            button.drawText(batch, font)
            batch.end()
        }
        
        // Draw battle list
        drawBattleList(batch, sr)
        
        // Handle input
        handleInput()
    }
    
    private fun drawBattleList(batch: SpriteBatch, sr: ShapeRenderer) {
        val listStartY = Gdx.graphics.height - 120f
        val battleHeight = 60f
        val battleSpacing = 10f
        val listX = 20f
        val listWidth = Gdx.graphics.width - 40f
        
        sr.begin(ShapeRenderer.ShapeType.Filled)
        
        battles.forEachIndexed { index, battle ->
            val battleY = listStartY - index * (battleHeight + battleSpacing) + scrollOffset
            
            // Skip if outside visible area
            if (battleY + battleHeight < 0 || battleY > Gdx.graphics.height - 120f) return@forEachIndexed
            
            // Draw battle background
            if (index == selectedBattleIndex) {
                sr.color = Color(0.3f, 0.5f, 0.8f, 1f) // Selected - blue
            } else {
                sr.color = Color(0.15f, 0.12f, 0.2f, 1f) // Normal - dark
            }
            sr.rect(listX.toFloat(), battleY, listWidth.toFloat(), battleHeight)
            
            // Draw battle border
            sr.end()
            sr.begin(ShapeRenderer.ShapeType.Line)
            sr.color = Color(0.3f, 0.25f, 0.4f, 1f) // Border
            sr.rect(listX.toFloat(), battleY, listWidth.toFloat(), battleHeight)
            sr.end()
            
            // Draw battle text
            sr.begin(ShapeRenderer.ShapeType.Filled)
            
            batch.begin()
            SimpleTextRenderer.drawText(batch, battle.name, listX + 10f, battleY + battleHeight - 15f, 16f, Color.WHITE)
            
            // Battle details
            val details = "${battle.mode} • ${battle.map} • ${battle.users}/${battle.maxPeople} • РАНГ ${battle.minRank}-${battle.maxRank}"
            SimpleTextRenderer.drawText(batch, details, listX + 10f, battleY + battleHeight - 35f, 12f, Color(0.7f, 0.7f, 0.7f, 1f))
            batch.end()
            
            // Join button with Tanki style
            val joinButtonX = listX + listWidth - 80f
            val joinButtonY = battleY + 10f
            val joinButtonWidth = 70f
            val joinButtonHeight = 30f
            
            sr.color = Color(0.2f, 0.6f, 0.2f, 1f) // Green join button
            sr.rect(joinButtonX, joinButtonY, joinButtonWidth, joinButtonHeight)
            
            // Draw join text
            batch.begin()
            SimpleTextRenderer.drawText(batch, "ВОЙТИ", joinButtonX + 10f, joinButtonY + joinButtonHeight - 8f, 12f, Color.WHITE)
            batch.end()
        }
        
        sr.end()
    }
    
    private fun handleInput() {
        if (Gdx.input.justTouched()) {
            val mouseX = Gdx.input.x.toFloat()
            val mouseY = Gdx.graphics.height - Gdx.input.y.toFloat()
            
            // Check back button
            backButton?.checkClick(mouseX, mouseY)
            
            // Check battle list clicks
            val listStartY = Gdx.graphics.height - 120f
            val battleHeight = 60f
            val battleSpacing = 10f
            val listX = 20f
            val listWidth = Gdx.graphics.width - 40f
            
            battles.forEachIndexed { index, battle ->
                val battleY = listStartY - index * (battleHeight + battleSpacing) + scrollOffset
                
                // Check if click is within battle row
                if (mouseX >= listX && mouseX <= listX + listWidth &&
                    mouseY >= battleY && mouseY <= battleY + battleHeight) {
                    
                    // Check if join button was clicked
                    val joinButtonX = listX + listWidth - 80f
                    val joinButtonY = battleY + 10f
                    val joinButtonWidth = 70f
                    val joinButtonHeight = 30f
                    
                    if (mouseX >= joinButtonX && mouseX <= joinButtonX + joinButtonWidth &&
                        mouseY >= joinButtonY && mouseY <= joinButtonY + joinButtonHeight) {
                        // Join battle
                        joinBattle(battle)
                    } else {
                        // Select battle
                        selectedBattleIndex = index
                        logger.info("Selected battle: ${battle.name}")
                    }
                }
            }
        }
        
        // Handle scrolling
        if (Gdx.input.isKeyPressed(com.badlogic.gdx.Input.Keys.UP)) {
            scrollOffset += 5f
        }
        if (Gdx.input.isKeyPressed(com.badlogic.gdx.Input.Keys.DOWN)) {
            scrollOffset -= 5f
        }
        
        // Limit scrolling
        val maxScroll = (battles.size - 1) * (60f + 10f)
        scrollOffset = scrollOffset.coerceIn(-maxScroll, 0f)
    }
    
    private fun joinBattle(battle: BattleInfo) {
        logger.info("Joining battle: ${battle.name}")
        // TODO: Connect to battle server
        uiManager.showScreen(ScreenType.BATTLE)
    }
    
    override fun dispose() {
        if (::font.isInitialized) {
            font.dispose()
        }
        if (::shapeRenderer.isInitialized) {
            shapeRenderer.dispose()
        }
        logger.info("Lobby screen disposed")
    }
}
