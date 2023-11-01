//
//  IntentHandler.swift
//  CharacterIntents
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Intents

class CharacterSearchIntentHandler: NSObject, CharacterSearchIntentHandling {
    
    func handle(intent: CharacterSearchIntent, completion: @escaping (CharacterSearchIntentResponse) -> Void) {
        // В этом методе вы обрабатываете запрос от Siri и выполняете поиск персонажа по имени.
        // Здесь предполагается, что ваш сервис поиска персонажей находится в вашей модели или службе.
        
        // Получение значения параметра "characterName" из интента.
        if let characterName = intent.characterName {
            // Вызов функции поиска персонажа по имени и получение результата.
            let searchResult = searchCharacter(name: characterName)
            
            if searchResult.isEmpty {
                // Если поиск не вернул результатов, возвращаем ответ о неудаче.
                let response = CharacterSearchIntentResponse.failureNoMatchingCharacters(characterName: characterName)
                completion(response)
            } else {
                // Если найдены персонажи, возвращаем успешный ответ с данными.
                let response = CharacterSearchIntentResponse.success(characters: searchResult)
                completion(response)
            }
        } else {
            // Если параметр "characterName" отсутствует, возвращаем ответ об ошибке.
            let response = CharacterSearchIntentResponse.failureNoCharacterName
            completion(response)
        }
    }
    
    func handle(intent: CharacterSearchIntent) async -> CharacterSearchIntentResponse {
        // Обработка асинхронного обработчика интента.
        // Здесь можно реализовать асинхронный поиск и возврат результата.
        // Тот же самый код обработки, что и в предыдущем методе.
        return CharacterSearchIntentResponse.failureNoCharacterName
    }
    
    func resolveCharacterName(for intent: CharacterSearchIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        // В этом методе вы можете реализовать разрешение параметра "characterName."
        // Здесь можно добавить логику для проверки и разрешения имени персонажа, если необходимо.
        // Пример реализации:
        if let characterName = intent.characterName, !characterName.isEmpty {
            // Если имя персонажа не пустое, считаем разрешением успешным.
            let resolutionResult = INStringResolutionResult.success(with: characterName)
            completion(resolutionResult)
        } else {
            // Если имя персонажа пустое, возвращаем ответ о неудаче.
            let resolutionResult = INStringResolutionResult.needsValue()
            completion(resolutionResult)
        }
    }
    
    func resolveCharacterName(for intent: CharacterSearchIntent) async -> INStringResolutionResult {
        // Аналогично, обработка асинхронного разрешения параметра "characterName."
        // Пример асинхронного разрешения (может потребовать дополнительной логики):
        return INStringResolutionResult.success(with: "Rick")
    }
    
    // Функция для поиска персонажей по имени (замените на свою реализацию).
    private func searchCharacter(name: String) -> [Character] {
        // Ваш код поиска персонажей по имени должен быть здесь.
        // Верните массив персонажей, соответствующих запросу.
        return []
    }
}



class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
