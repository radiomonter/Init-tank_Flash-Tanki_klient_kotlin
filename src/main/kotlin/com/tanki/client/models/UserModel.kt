package com.tanki.client.models

import org.slf4j.LoggerFactory

data class User(
    val id: String,
    val username: String,
    val rank: Int,
    val crystals: Int,
    val experience: Long,
    val nextScore: Long = 1000L,   // очков до следующего ранга
    val premium: Boolean = false,
    val clanId: String? = null
)

data class Tank(
    val id: String,
    val name: String,
    val weaponId: String,
    val hullId: String,
    val paintId: String,
    val modifications: List<String> = emptyList(),
    val rating: Int = 1000,
    val battles: Int = 0,
    val wins: Int = 0
)

data class TankSpec(
    val id: String,
    val name: String,
    val description: String,
    val speed: Float,
    val armor: Int,
    val damage: Int,
    val rank: Int,
    val price: Int
)

class UserModel {

    private val logger = LoggerFactory.getLogger("UserModel")

    private var currentUser: User? = null
    private var currentTank: Tank? = null

    private val tankSpecs = mapOf(
        "hunter"   to TankSpec("hunter",   "Hunter",   "Light and fast",        12f, 100, 45,  1,  1000),
        "viking"   to TankSpec("viking",   "Viking",   "Balanced medium tank",   8f, 150, 60,  5,  3000),
        "dictator" to TankSpec("dictator", "Dictator", "Heavy armored tank",     5f, 200, 80,  10, 8000),
        "mammoth"  to TankSpec("mammoth",  "Mammoth",  "Super heavy tank",       3f, 250, 100, 15, 15000)
    )

    fun initialize() { logger.info("UserModel initialized") }

    fun setFromServer(username: String, rank: Int, crystals: Int, score: Long, nextScore: Long, premium: Boolean) {
        currentUser = User(
            id = username, username = username,
            rank = rank, crystals = crystals,
            experience = score, nextScore = nextScore,
            premium = premium
        )
        logger.info("User from server: $username rank=$rank crystals=$crystals score=$score nextScore=$nextScore")
    }

    fun getCurrentUser(): User? = currentUser

    fun getCurrentTank(): Tank? = currentTank

    fun getTankSpec(tankId: String): TankSpec? = tankSpecs[tankId]

    fun logout() {
        currentUser = null
        currentTank = null
        logger.info("User logged out")
    }

    fun updateCrystals(amount: Int) {
        currentUser = currentUser?.copy(crystals = (currentUser?.crystals ?: 0) + amount)
    }

    fun dispose() { logger.info("UserModel disposed") }
}
