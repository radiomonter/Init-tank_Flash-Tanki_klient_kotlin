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
    val modifications: List<String> = emptyList()
)

class UserModel {
    
    private val logger = LoggerFactory.getLogger("UserModel")
    
    private var currentUser: User? = null
    private var currentTank: Tank? = null
    
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
            // For now, create a mock user
            currentUser = User(
                id = "12345",
                username = username,
                rank = 15,
                crystals = 1000,
                experience = 50000L
            )
            
            // Mock tank
            currentTank = Tank(
                id = "tank_001",
                name = "Hunter",
                weaponId = "smoky",
                hullId = "hunter",
                paintId = "green"
            )
            
            logger.info("Login successful for user: $username")
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
