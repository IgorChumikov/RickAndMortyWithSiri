//
//  IntentHandler.swift
//  CharacterIntents
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Intents

class CharacterSearchIntentHandler: NSObject, CharacterSearchIntentHandling {
    
    let service: Service
      
      override init() {
          service = Service()
          super.init()
      }
    
    // Метод обработки интента. Здесь вы выполняете поиск персонажа по имени.
    func handle(intent: CharacterSearchIntent, completion: @escaping (CharacterSearchIntentResponse) -> Void) {
         // Получение всех персонажей
         let characters = service.getCharacters()
         
         if let characterName = intent.characterName {
             if characters.contains(where: { $0.name.lowercased() == characterName.lowercased() }) {
                 completion(CharacterSearchIntentResponse.success(characters: characterName))
             } else {
                 completion(CharacterSearchIntentResponse.init(code: .failure, userActivity: nil))
             }
         } else {
             completion(CharacterSearchIntentResponse.init(code: .failure, userActivity: nil))
         }
     }
    
    // Метод позволяет вашему приложению предоставить дополнительные детали и подтверждение пользователю, чтобы удостовериться, что интент будет выполнен правильно.
    func confirm(intent: CharacterSearchIntent, completion: @escaping (CharacterSearchIntentResponse) -> Void) {
        if let characterName = intent.characterName {
            // Вам может потребоваться добавить логику для подтверждения ваших действий, например:
            
            // 1. Показать пользователю сообщение с предварительными деталями запроса
            let confirmationMessage = "Вы уверены, что хотите найти персонажа по имени '\(characterName)'?"
            
            // 2. Создать userActivity для интента с дополнительными данными, если необходимо
            let userActivity = NSUserActivity(activityType: "com.example.CharacterSearch")
            
            // 3. Создать CharacterSearchIntentResponse с кодом .ready и сообщением подтверждения
            let response = CharacterSearchIntentResponse(code: .ready, userActivity: userActivity)
            
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
            let characters = service.getCharacters()
            
            if characters.contains(where: { $0.name.lowercased() == characterName.lowercased() }) {
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
        guard intent is CharacterSearchIntent else {
            fatalError("FatalError")
        }

        return CharacterSearchIntentHandler()
    }
}
