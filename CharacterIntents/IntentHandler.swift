//
//  IntentHandler.swift
//  CharacterIntents
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Intents

class CharacterSearchIntentHandler: NSObject, CharacterSearchIntentHandling {
    
    // Метод обработки интента. Здесь вы выполняете поиск персонажа по имени.
    func handle(intent: CharacterSearchIntent, completion: @escaping (CharacterSearchIntentResponse) -> Void) {
        print(intent.characterName!)
        
        if let characterName = intent.characterName {
            completion(CharacterSearchIntentResponse.success(characters: characterName))
        } else {
            completion(CharacterSearchIntentResponse.init(code: .failure, userActivity: nil))
        }
    }
    
    // Метод позволяет вашему приложению предоставить дополнительные детали и подтверждение пользователю, чтобы удостовериться, что интент будет выполнен правильно.
    func confirm(intent: CharacterSearchIntent, completion: @escaping (CharacterSearchIntentResponse) -> Void) {
        if let characterName = intent.characterName {
            let response = CharacterSearchIntentResponse(code: .ready, userActivity: nil)
            completion(response)
        } else {
            // Если не удалось получить имя персонажа, можно вернуть неудачный ответ.
            completion(CharacterSearchIntentResponse(code: .failure, userActivity: nil))
        }
    }

    
    // // Метод разрешения параметра "characterName." Здесь можно добавить логику для проверки и разрешения имени персонажа, если необходимо.
    func resolveCharacterName(for intent: CharacterSearchIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let characterName = intent.characterName {
            // Проверка, существует ли персонаж с заданным именем
            if true { // isCharacterValid(characterName)
                // Персонаж существует, разрешение успешно
                completion(INStringResolutionResult.success(with: characterName))
            } else {
                // Персонаж не найден, разрешение с неудачей
                completion(INStringResolutionResult.unsupported())
            }
        } else {
            // Имя персонажа отсутствует, разрешение с неудачей
            completion(INStringResolutionResult.needsValue())
        }
    }

    
}



class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
