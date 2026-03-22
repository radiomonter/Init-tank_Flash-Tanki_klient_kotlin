# Tanki Client Kotlin

Миграция Flash ActionScript клиента танковой игры на Kotlin с современными технологиями.

## 🎯 Цель проекта

Перенести функционал Flash клиента на Kotlin с использованием современных библиотек и фреймворков.

## 🛠️ Технологический стек

- **Kotlin 1.9.20** - основной язык разработки
- **LibGDX** - 2D/3D игровой движок (замена Alternativa3D)
- **Ktor** - сетевой клиент и WebSocket
- **Koin** - Dependency Injection (замена OSGi)
- **Coroutines** - асинхронное программирование
- **Serialization** - JSON сериализация
- **Logback** - логирование

## 📁 Структура проекта

```
src/main/kotlin/com/tanki/client/
├── TankiClient.kt          # Точка входа
├── core/
│   └── GameEngine.kt       # Основной игровой движок
├── network/
│   └── NetworkManager.kt   # Сетевое взаимодействие
├── gui/
│   ├── UIManager.kt        # Управление интерфейсом
│   ├── UIScreen.kt         # Базовый класс экранов
│   ├── MainMenuScreen.kt   # Главное меню
│   ├── LobbyScreen.kt      # Лобби боев
│   ├── GarageScreen.kt     # Гараж
│   └── BattleScreen.kt     # Боевой экран
├── models/
│   ├── UserModel.kt        # Модель пользователя
│   ├── ChatModel.kt        # Чат система
│   ├── GarageModel.kt      # Гараж и предметы
│   └── BattleModel.kt      # Боевая система
└── di/
    └── GameModule.kt       # Модуль DI
```

## 🚀 Запуск проекта

### Требования
- JDK 17+
- Gradle 8.0+

### Сборка и запуск
```bash
# Клонировать проект
git clone <repository-url>
cd Init-tank_Flash-Tanki_klient_kotlin

# Собрать проект
./gradlew build

# Запустить
./gradlew run
```

## 📋 Реализованный функционал

### ✅ Готово
- [x] Базовая структура проекта
- [x] Dependency Injection контейнер
- [x] Основной игровой движок на LibGDX
- [x] Сетевой менеджер с WebSocket
- [x] GUI система с экранами
- [x] Модели данных (User, Chat, Garage, Battle)
- [x] Система логирования

### 🚧 В процессе
- [ ] 3D рендеринг танков
- [ ] Физика движения
- [ ] Система боевых механик
- [ ] Анимации и эффекты
- [ ] Звуковая система

### 📋 План миграции с Flash

#### Этап 1: Core компоненты
- [x] UserModel → UserModel.kt
- [x] ChatModel → ChatModel.kt  
- [x] GarageModel → GarageModel.kt
- [x] BattleController → BattleModel.kt

#### Этап 2: GUI компоненты
- [x] MainPanel → MainMenuScreen.kt
- [x] Forms → Screen классы
- [ ] Controls → LibGDX Input

#### Этап 3: Сетевая архитектура
- [x] Network → NetworkManager.kt
- [ ] Commands → NetworkCommand
- [ ] Protocol → Ktor WebSocket

#### Этап 4: Графика и 3D
- [ ] Alternativa3D → LibGDX 3D
- [ ] Resources → AssetManager
- [ ] Effects → Particle System

## 🔧 Конфигурация

### Сервер подключения
```kotlin
// В NetworkManager.kt
suspend fun connect(serverUrl: String, port: Int)
```

### Настройки графики
```kotlin
// В GameEngine.kt
camera.setToOrtho(false, width.toFloat(), height.toFloat())
```

## 📝 Заметки по миграции

1. **OSGi → Koin**: Замена модульной системы на DI контейнер
2. **Flash Display → LibGDX**: Переход на игровой движок
3. **ActionScript → Kotlin**: Синтаксическая миграция
4. **Socket → Ktor WebSocket**: Современная сетевая библиотека
5. **Events → Coroutines Flow**: Реактивное программирование

## 🤝 Contributing

1. Fork проекта
2. Создание feature branch
3. Commit изменений
4. Push в ветку
5. Создание Pull Request

## 📄 Лицензия

MIT License - см. файл LICENSE

## Сборка
.\gradlew.bat build


## Запуск

.\gradlew.bat run
java -jar build\libs\Init-tank_Flash-Tanki_klient_kotlin-1.0.0.jar