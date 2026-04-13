package com.tanki.client.models

import org.slf4j.LoggerFactory

data class BattleInfo(
    val id: String,
    val name: String,
    val mapName: String,
    val mode: BattleMode,
    val maxPlayers: Int,
    val currentPlayers: Int,
    val timeLimit: Int,
    val scoreLimit: Int,
    val isPrivate: Boolean = false
)

enum class BattleMode { DEATHMATCH, TEAM_DEATHMATCH, CAPTURE_THE_FLAG, ASSAULT }

data class TankInBattle(
    val id: String,
    val userId: String,
    val username: String,
    val position: Vector3,
    val rotation: Float,
    val health: Int,
    val maxHealth: Int,
    val team: Team? = null
)

data class Vector3(val x: Float, val y: Float, val z: Float)

enum class Team { RED, BLUE }

data class BattleEvent(
    val type: EventType,
    val timestamp: Long,
    val data: Map<String, String> = emptyMap()
)

enum class EventType {
    TANK_DESTROYED, TANK_RESPAWNED, FLAG_CAPTURED,
    BATTLE_STARTED, BATTLE_ENDED, PLAYER_JOINED, PLAYER_LEFT
}

class BattleModel {

    private val logger = LoggerFactory.getLogger("BattleModel")

    var currentBattle: BattleInfo? = null; private set
    var tanksInBattle: List<TankInBattle> = emptyList(); private set
    private val _battleEvents = mutableListOf<BattleEvent>()
    val battleEvents: List<BattleEvent> get() = _battleEvents
    var isInBattle: Boolean = false; private set
    var playerScore: Int = 0; private set
    var playerKills: Int = 0; private set
    var playerDeaths: Int = 0; private set

    fun initialize() { logger.info("Initializing Battle Model...") }

    fun joinBattle(battleId: String): Boolean {
        return try {
            currentBattle = BattleInfo(battleId, "Test Battle", "Sandbox",
                BattleMode.DEATHMATCH, 8, 1, 600, 50)
            isInBattle = true
            tanksInBattle = listOf(TankInBattle("player_tank", "current_user", "Player",
                Vector3(0f, 0f, 0f), 0f, 100, 100))
            addBattleEvent(EventType.PLAYER_JOINED, mapOf("username" to "Player"))
            logger.info("Joined battle: $battleId")
            true
        } catch (e: Exception) {
            logger.error("Failed to join battle: $battleId", e); false
        }
    }

    fun leaveBattle() {
        currentBattle = null
        tanksInBattle = emptyList()
        _battleEvents.clear()
        isInBattle = false
        playerScore = 0; playerKills = 0; playerDeaths = 0
        logger.info("Left battle")
    }

    fun updateTankPosition(tankId: String, position: Vector3, rotation: Float) {
        tanksInBattle = tanksInBattle.map {
            if (it.id == tankId) it.copy(position = position, rotation = rotation) else it
        }
    }

    fun takeDamage(tankId: String, damage: Int) {
        tanksInBattle = tanksInBattle.map {
            if (it.id == tankId) it.copy(health = maxOf(0, it.health - damage)) else it
        }
        val destroyed = tanksInBattle.find { it.id == tankId && it.health == 0 }
        if (destroyed != null) {
            addBattleEvent(EventType.TANK_DESTROYED, mapOf("tankId" to tankId, "username" to destroyed.username))
            if (tankId == "player_tank") playerDeaths++
        }
    }

    fun addKill() {
        playerKills++
        playerScore += 100
        logger.info("Player got a kill")
    }

    private fun addBattleEvent(type: EventType, data: Map<String, String> = emptyMap()) {
        _battleEvents.add(BattleEvent(type, System.currentTimeMillis(), data))
        if (_battleEvents.size > 50) _battleEvents.removeAt(0)
    }

    fun getAvailableBattles(): List<BattleInfo> = listOf(
        BattleInfo("battle1", "Desert DM",  "Desert", BattleMode.DEATHMATCH,        8,  5, 600,  50),
        BattleInfo("battle2", "Island TDM", "Island", BattleMode.TEAM_DEATHMATCH,   12, 8, 900,  100),
        BattleInfo("battle3", "City CTF",   "City",   BattleMode.CAPTURE_THE_FLAG,  16, 12, 1200, 3)
    )

    fun dispose() { leaveBattle(); logger.info("Disposing Battle Model...") }
}
