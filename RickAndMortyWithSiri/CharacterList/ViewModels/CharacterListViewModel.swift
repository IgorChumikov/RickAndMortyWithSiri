//
//  CharacterListViewModel.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import SwiftUI
import Combine

// MARK: - CharacterListViewModel

final class CharacterListViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var characters: [Character] = []
    private let service: Service
    
    // MARK: - Init
    
    init(service: Service) {
        self.service = service
    }
    
    // MARK: - Functions

    func getCharacters() {
        self.characters = service.fetchCharacters()
    }
}
