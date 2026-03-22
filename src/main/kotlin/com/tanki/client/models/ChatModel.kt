package com.tanki.client.models

import org.slf4j.LoggerFactory

data class ChatMessage(
    val id: String,
    val userId: String,
    val username: String,
    val message: String,
    val timestamp: Long,
    val channel: ChatChannel = ChatChannel.GLOBAL
)

enum class ChatChannel { GLOBAL, BATTLE, CLAN, PRIVATE }

class ChatModel {

    private val logger = LoggerFactory.getLogger("ChatModel")

    private val _messages = mutableListOf<ChatMessage>()
    val messages: List<ChatMessage> get() = _messages

    var currentChannel: ChatChannel = ChatChannel.GLOBAL
        private set

    var isConnected: Boolean = false
        private set

    fun initialize() {
        logger.info("Initializing Chat Model...")
        isConnected = true
    }

    fun sendMessage(message: String, channel: ChatChannel = ChatChannel.GLOBAL): Boolean {
        if (message.isBlank()) return false
        val msg = ChatMessage(
            id        = "msg_${System.currentTimeMillis()}_${(0..999).random()}",
            userId    = "current_user_id",
            username  = "Player",
            message   = message.trim(),
            timestamp = System.currentTimeMillis(),
            channel   = channel
        )
        addMessage(msg)
        logger.info("Sent message in $channel: $message")
        return true
    }

    fun receiveMessage(message: ChatMessage) {
        addMessage(message)
        logger.debug("Received from ${message.username}: ${message.message}")
    }

    private fun addMessage(message: ChatMessage) {
        _messages.add(message)
        if (_messages.size > 100) _messages.removeAt(0)
    }

    fun switchChannel(channel: ChatChannel) {
        currentChannel = channel
        _messages.clear()
        logger.info("Switched to channel: $channel")
    }

    fun getMessagesForChannel(channel: ChatChannel): List<ChatMessage> =
        _messages.filter { it.channel == channel }

    fun clearMessages() {
        _messages.clear()
        logger.info("Cleared chat messages")
    }

    fun dispose() {
        isConnected = false
        logger.info("Disposing Chat Model...")
    }
}
