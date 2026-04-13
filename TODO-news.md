# Отображение новостей

## План
**Цель:** Сделать новости видимыми на MainMenuScreen

**Проблема:** NetworkManager парсит `lobby;shownews` но не сохраняет в UserModel. `currentNews = null`, поэтому `renderNews()` не вызывается.

**Шаги:**
1. [ ] NetworkManager: при парсинге `shownews` создать News и вызвать `userModel.setNews(news)`
2. [ ] UserModel: inject NetworkManager или callback
3. [ ] `./gradlew build && ./gradlew run`
4. [ ] Тест: логин → сервер отправляет новости → видны на MainMenu

**Зависимости:** UserModel.kt, NetworkManager.kt, di/GameModule.kt

Продолжить? 
