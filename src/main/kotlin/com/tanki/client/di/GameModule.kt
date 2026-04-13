package com.tanki.client.di

import com.tanki.client.core.GameEngine
import com.tanki.client.gui.UIManager
import com.tanki.client.network.NetworkManager
import com.tanki.client.models.UserModel
import com.tanki.client.models.ChatModel
import com.tanki.client.models.GarageModel
import com.tanki.client.models.BattleModel
import com.tanki.client.models.NewsModel
import com.tanki.client.auth.AuthService
import org.koin.dsl.module

val gameModule = module {
    
    // Core components
    single { GameEngine() }
    single { NetworkManager() }
    single { UIManager() }
    
    // Models (similar to Flash models)
    single { UserModel() }
    single { ChatModel() }
    single { GarageModel() }
    single { BattleModel() }
    single { NewsModel() }
    
    // Services
    single { AuthService() }
    
    // Services can be added here
    // single { BattleService() }
    // single { ResourceService() }
    // single { AudioService() }
}
