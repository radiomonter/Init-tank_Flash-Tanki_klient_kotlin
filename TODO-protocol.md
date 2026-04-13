# Изменение протокола шифрования под сервер

## Шаги:
- [x] 1. Прочитать сервер EncryptionTransformer.kt и клиент NetworkManager.kt.
- [ ] 2. Заменить Byte UTF8 encrypt/decrypt → String XOR Char(code ± (key+1)).
- [ ] 3. receiveLoop: StringBuilder.indexOf("~dne").
- [ ] 4. `./gradlew compileKotlin`.
- [ ] 5. Тест `./gradlew run` + логин.
- [ ] 6. Завершить.
