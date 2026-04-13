package com.tanki.client.models

import org.slf4j.LoggerFactory

data class News(
    val id: String,
    val header: String,
    val text: String,
    val date: String,
    val image: String? = null
)

class NewsModel {

    private val logger = LoggerFactory.getLogger("NewsModel")

    private val newsList = mutableListOf<News>()

    var onNewsUpdated: (() -> Unit)? = null

    fun setNews(news: News) {
        newsList.clear()
        newsList.add(news)
        logger.info("News set: id=${news.id} header=${news.header}")
        onNewsUpdated?.invoke()
    }

    fun addNews(news: News) {
        newsList.removeIf { it.id == news.id }
        newsList.add(0, news)
        logger.info("News added: id=${news.id}")
        onNewsUpdated?.invoke()
    }

    fun getLatest(): News? = newsList.firstOrNull()

    fun getAll(): List<News> = newsList.toList()

    fun clear() { newsList.clear() }
}
