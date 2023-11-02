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
    @Published var characterName: String = "" {
        didSet {
            getCharacterName(name: characterName)
        }
    }
    
    
    // MARK: - Private properties

    private let service: Service
    
    // MARK: - Init
    
    init(service: Service) {
        self.service = service
    }
    
    // MARK: - Functions

    func getCharacters() {
        self.characters = service.getCharacters()
    }
    
    private func getCharacterName(name: String) {
        service.getCharacterByName(characterName: name) { characters in
            self.characters = characters
        }
    }
    
    func interaction() {
        let intent = CharacterSearchIntent()
    }
}
