//
//  CharacterResponse.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Foundation

// MARK: - Character

struct CharacterResponse: Codable {
    // MARK: - Properties
    
    let results: [Character]
    
    // MARK: - Init
    
    init(results: [Character]) {
        self.results = results
    }
}
