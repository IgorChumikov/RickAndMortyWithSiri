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
        
      
    }
    
    // Метод позволяет вашему приложению предоставить дополнительные детали и подтверждение пользователю, чтобы удостовериться, что интент будет выполнен правильно.
    func confirm(intent: CharacterSearchIntent, completion: @escaping (CharacterSearchIntentResponse) -> Void) {
        
    }
    
    // // Метод разрешения параметра "characterName." Здесь можно добавить логику для проверки и разрешения имени персонажа, если необходимо.
    func resolveCharacterName(for intent: CharacterSearchIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
    
    }
    
}



class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
