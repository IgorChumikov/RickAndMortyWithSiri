//
//  Service.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import Foundation
import Combine

// MARK: - Service

final class Service {
    func fetchCharacters() -> [Character] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return [] }
        
        let data = try? Data(contentsOf: url)
        let response = data.flatMap { try? JSONDecoder().decode(CharacterResponse.self, from: $0) }
        return response?.results ?? []
    }
}

