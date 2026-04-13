package com.tanki.client.auth

import org.slf4j.LoggerFactory
import java.util.regex.Pattern

data class RegistrationRequest(val username: String, val email: String, val password: String)
data class LoginRequest(val username: String, val password: String)
data class AuthResponse(val success: Boolean, val message: String, val userId: String? = null, val token: String? = null)
data class AuthUser(
    val id: String, val username: String, val email: String,
    val rank: Int = 1, val crystals: Int = 1000, val experience: Long = 0L,
    val isPremium: Boolean = false
)

class AuthService {

    private val logger = LoggerFactory.getLogger("AuthService")

    private val users    = mutableMapOf<String, AuthUser>()
    private val sessions = mutableMapOf<String, String>()

    init {
        users["test"]  = AuthUser("2", "test",  "test@tanki.com",  15, 5000,   50000L)
    }

    fun register(request: RegistrationRequest): AuthResponse {
        val err = validateRegistration(request)
        if (err != null) return AuthResponse(false, err)
        if (users.containsKey(request.username.lowercase())) return AuthResponse(false, "Username already exists")
        val user = AuthUser((users.size + 1).toString(), request.username, request.email)
        users[request.username.lowercase()] = user
        val token = generateToken(user.id)
        sessions[token] = user.id
        logger.info("Registered: ${request.username}")
        return AuthResponse(true, "Registration successful!", user.id, token)
    }

    fun login(request: LoginRequest): AuthResponse {
        if (request.username.isBlank() || request.password.isBlank())
            return AuthResponse(false, "Username and password required")
        val user = users[request.username.lowercase()]
            ?: return AuthResponse(false, "Invalid username or password")
        val token = generateToken(user.id)
        sessions[token] = user.id
        logger.info("Login: ${request.username}")
        return AuthResponse(true, "Welcome back, ${user.username}!", user.id, token)
    }

    fun logout(token: String): Boolean = sessions.remove(token) != null

    fun validateToken(token: String): AuthUser? {
        val userId = sessions[token] ?: return null
        return users.values.find { it.id == userId }
    }

    private fun validateRegistration(r: RegistrationRequest): String? = when {
        r.username.isBlank()                                    -> "Username cannot be empty"
        r.username.length < 3                                   -> "Username must be at least 3 characters"
        !USERNAME_PATTERN.matcher(r.username).matches()         -> "Username: letters, numbers, underscores only"
        r.email.isBlank()                                       -> "Email cannot be empty"
        !EMAIL_PATTERN.matcher(r.email).matches()               -> "Invalid email format"
        r.password.isBlank()                                    -> "Password cannot be empty"
        r.password.length < 6                                   -> "Password must be at least 6 characters"
        else                                                    -> null
    }

    private fun generateToken(userId: String) = "token_${userId}_${System.currentTimeMillis()}"

    companion object {
        private val USERNAME_PATTERN = Pattern.compile("^[a-zA-Z0-9_]{3,20}$")
        private val EMAIL_PATTERN    = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
    }
}
