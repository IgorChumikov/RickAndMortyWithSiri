//
//  CharacterResponse.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Foundation

// MARK: - Character

public struct CharacterResponse: Codable {
    // MARK: - Properties
    
    public let results: [Character]
    
    // MARK: - Init
    
    public init(results: [Character]) {
        self.results = results
    }
}
