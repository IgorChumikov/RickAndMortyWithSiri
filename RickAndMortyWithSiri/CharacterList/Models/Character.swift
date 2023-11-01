//
//  Character.swift
//  RickAndMortyWithSiri
//
//  Created by Игорь Чумиков on 01.11.2023.
//


import Foundation

// MARK: - Character

public struct Character: Identifiable, Codable {
    // MARK: - Properties
    
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: Location
    public let location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    
    // MARK: - Init
    
    public init(id: Int,
         name: String,
         status: String,
         species: String,
         type: String,
         gender: String,
         origin: Location,
         location: Location,
         image: String,
         episode: [String],
         url: String,
         created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}



