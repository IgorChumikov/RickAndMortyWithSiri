//
//  CharacterListView.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//


import SwiftUI

// MARK: - CharacterListView

struct CharacterListView: View {
    // MARK: - Properties
    
    @StateObject var viewModel = CharacterListViewModel(service: Service())
    
    // MARK: - Content
    
    var body: some View {
        List(viewModel.characters) { character in
            HStack(alignment: .center, spacing: 10) {
                imageCharacter(character: character)
                infoCharacter(character: character)
            }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.getCharacters()
        }
    }
    
    // MARK: - Private Views
    
    private func infoCharacter(character: Character) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(character.name)
                .font(.title2).bold()
            Text("Status: \(character.status)")
            Text("Species: \(character.species)")
            Text("Gender: \(character.gender)")
        }
    }
    
    private func imageCharacter(character: Character) -> some View {
        AsyncImage(url: URL(string: character.image)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            case .failure:
                Text("Image not available")
            }
        }
    }
}

#Preview {
    CharacterListView(
        viewModel: CharacterListViewModel(service: Service())
    )
}

