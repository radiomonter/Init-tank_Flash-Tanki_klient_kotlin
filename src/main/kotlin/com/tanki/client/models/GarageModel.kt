package com.tanki.client.models

import org.slf4j.LoggerFactory

data class GarageItem(
    val id: String,
    val name: String,
    val type: ItemType,
    val price: Int,
    val rank: Int,
    val owned: Boolean = false,
    val mounted: Boolean = false,
    val modifications: List<Modification> = emptyList()
)

enum class ItemType { HULL, WEAPON, PAINT, SUPPLY }

data class Modification(
    val id: String,
    val name: String,
    val level: Int,
    val price: Int,
    val unlocked: Boolean = false
)

class GarageModel {

    private val logger = LoggerFactory.getLogger("GarageModel")

    var items: List<GarageItem> = emptyList()
        private set

    var currentHull: GarageItem? = null; private set
    var currentWeapon: GarageItem? = null; private set
    var currentPaint: GarageItem? = null; private set

    fun initialize() {
        logger.info("Initializing Garage Model...")
        loadMockData()
    }

    private fun loadMockData() {
        val mock = listOf(
            GarageItem("hull_hunter",   "Hunter",        ItemType.HULL,   0,    1, owned = true,  mounted = true),
            GarageItem("hull_viking",   "Viking",        ItemType.HULL,   500,  5),
            GarageItem("weapon_smoky",  "Smoky",         ItemType.WEAPON, 0,    1, owned = true,  mounted = true),
            GarageItem("weapon_railgun","Railgun",       ItemType.WEAPON, 1000, 10),
            GarageItem("paint_green",   "Green",         ItemType.PAINT,  100,  1, owned = true,  mounted = true),
            GarageItem("paint_blue",    "Blue",          ItemType.PAINT,  150,  3),
            GarageItem("supply_health", "First Aid Kit", ItemType.SUPPLY, 50,   1, owned = true),
            GarageItem("supply_armor",  "Double Armor",  ItemType.SUPPLY, 75,   5)
        )
        items = mock
        currentHull   = mock.find { it.type == ItemType.HULL   && it.mounted }
        currentWeapon = mock.find { it.type == ItemType.WEAPON && it.mounted }
        currentPaint  = mock.find { it.type == ItemType.PAINT  && it.mounted }
        logger.info("Loaded ${mock.size} garage items")
    }

    fun getItemsByType(type: ItemType): List<GarageItem> = items.filter { it.type == type }

    fun purchaseItem(itemId: String): Boolean {
        val item = items.find { it.id == itemId } ?: return false.also { logger.warn("Item not found: $itemId") }
        if (item.owned) return false.also { logger.warn("Already owned: $itemId") }
        items = items.map { if (it.id == itemId) it.copy(owned = true) else it }
        logger.info("Purchased: ${item.name}")
        return true
    }

    fun mountItem(itemId: String): Boolean {
        val item = items.find { it.id == itemId } ?: return false.also { logger.warn("Item not found: $itemId") }
        if (!item.owned) return false.also { logger.warn("Not owned: $itemId") }
        items = items.map {
            when {
                it.type == item.type && it.id == itemId -> it.copy(mounted = true)
                it.type == item.type                    -> it.copy(mounted = false)
                else                                    -> it
            }
        }
        val mounted = item.copy(mounted = true)
        when (item.type) {
            ItemType.HULL   -> currentHull   = mounted
            ItemType.WEAPON -> currentWeapon = mounted
            ItemType.PAINT  -> currentPaint  = mounted
            ItemType.SUPPLY -> {}
        }
        logger.info("Mounted: ${item.name}")
        return true
    }

    fun dispose() { logger.info("Disposing Garage Model...") }
}
