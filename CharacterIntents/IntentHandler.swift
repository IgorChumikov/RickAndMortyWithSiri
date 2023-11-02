//
//  IntentHandler.swift
//  CharacterIntents
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        guard intent is CharacterSearchIntent else {
            fatalError("FatalError")
        }

        return CharacterSearchIntentHandler()
    }
}
