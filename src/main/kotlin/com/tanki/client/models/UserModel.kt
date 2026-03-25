package com.tanki.client.models

import org.slf4j.LoggerFactory

data class User(
    val id: String,
    val username: String,
    val rank: Int,
    val crystals: Int,
    val experience: Long,
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

// Tank specifications
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
    
    // Tank specifications database
    private val tankSpecs = mapOf(
        "hunter" to TankSpec("hunter", "Hunter", "Light and fast tank", 12f, 100, 45, 1, 1000),
        "viking" to TankSpec("viking", "Viking", "Balanced medium tank", 8f, 150, 60, 5, 3000),
        "dictator" to TankSpec("dictator", "Dictator", "Heavy tank with strong armor", 5f, 200, 80, 10, 8000),
        "mammoth" to TankSpec("mammoth", "Mammoth", "Super heavy tank", 3f, 250, 100, 15, 15000),
        "railgun" to TankSpec("railgun", "Rail Gun", "Long range weapon", 10f, 80, 120, 8, 5000),
        "freeze" to TankSpec("freeze", "Freeze", "Freezing weapon", 9f, 90, 50, 3, 2000)
    )
    
    fun initialize() {
        logger.info("Initializing User Model...")
        // Load user data from local storage or server
    }
    
    fun setFromServer(username: String, rank: Int, crystals: Int, score: Long, premium: Boolean) {
        currentUser = User(
            id = username,
            username = username,
            rank = rank,
            crystals = crystals,
            experience = score,
            premium = premium
        )
        logger.info("User set from server: $username rank=$rank crystals=$crystals")
    }

    fun login(username: String, password: String): Boolean {
        return try {
            logger.info("Attempting login for user: $username")
            
            // TODO: Implement actual authentication with server
            // For now, create a mock user with random tank
            val randomTankType = listOf("hunter", "viking", "dictator", "mammoth").random()
            val tankSpec = tankSpecs[randomTankType] ?: tankSpecs["hunter"]!!
            
            currentUser = User(
                id = username,
                username = username,
                rank = (1..20).random(), // Random rank for demo
                crystals = (500..5000).random(), // Random crystals
                experience = (10000L..100000L).random()
            )
            
            // Mock tank with random stats
            currentTank = Tank(
                id = tankSpec.id,
                name = tankSpec.name,
                weaponId = listOf("smoky", "firebird", "freeze").random(),
                hullId = tankSpec.id,
                paintId = listOf("green", "blue", "red", "camouflage").random(),
                modifications = listOf("M1", "M2", "M3").shuffled().take((1..3).random()),
                rating = (800..1500).random(),
                battles = (50..500).random(),
                wins = (20..200).random()
            )
            
            logger.info("Login successful for user: $username with tank: ${currentTank?.name}")
            true
            
        } catch (e: Exception) {
            logger.error("Login failed for user: $username", e)
            false
        }
    }
    
    fun logout() {
        logger.info("Logging out user: ${currentUser?.username}")
        currentUser = null
        currentTank = null
    }
    
    fun getCurrentUser(): User? = currentUser
    
    fun getCurrentTank(): Tank? = currentTank
    
    fun getTankSpec(tankId: String): TankSpec? = tankSpecs[tankId]
    
    fun getCurrentTankSpec(): TankSpec? = currentTank?.let { tankSpecs[it.hullId] }
    
    fun updateCrystals(amount: Int) {
        currentUser?.let { user ->
            currentUser = user.copy(crystals = user.crystals + amount)
            logger.info("Updated crystals: ${currentUser?.crystals}")
        }
    }
    
    fun addExperience(exp: Long) {
        currentUser?.let { user ->
            val newExp = user.experience + exp
            val newRank = calculateRank(newExp)
            currentUser = user.copy(experience = newExp, rank = newRank)
            logger.info("Added experience: $exp, new rank: $newRank")
        }
    }
    
    private fun calculateRank(experience: Long): Int {
        // Simple rank calculation based on experience
        return (experience / 10000).toInt() + 1
    }
    
    fun switchTank(tankId: String) {
        logger.info("Switching to tank: $tankId")
        // TODO: Implement tank switching logic
    }
    
    fun dispose() {
        logger.info("Disposing User Model...")
        // Cleanup resources
    }
}
