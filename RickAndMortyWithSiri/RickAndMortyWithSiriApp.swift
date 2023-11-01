//
//  RickAndMortyWithSiriApp.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//

import SwiftUI

@main
struct RickAndMortyWithSiriApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: CharacterListViewModel(service: Service()))
        }
    }
}
