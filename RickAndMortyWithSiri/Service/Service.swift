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
    // Создайте базовый URL
    let baseURL = "https://rickandmortyapi.com/api/character"
    
    func getCharacters() -> [Character] {
        guard let url = URL(string: baseURL) else { return [] }
        
        let data = try? Data(contentsOf: url)
        let response = data.flatMap { try? JSONDecoder().decode(CharacterResponse.self, from: $0) }
        return response?.results ?? []
    }
    
    func getCharacterByName(characterName: String, completion: @escaping ([Character]) -> Void) {
        // Добавьте параметр фильтрации по имени к базовому URL
        let urlString = "\(baseURL)?name=\(characterName)"
        
        if let url = URL(string: urlString) {
            // Ваш URL готов к использованию
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Ошибка при выполнении запроса: \(error)")
                    completion([])
                } else if let data = data {
                    do {
                        let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
                        // Ваш ответ теперь в типизированной структуре CharacterResponse
                        let characters = response.results
                        // Здесь вы можете использовать characters для дальнейшей обработки
                        completion(characters)
                    } catch {
                        print("Ошибка при разборе JSON: \(error)")
                        completion([])
                    }
                }
            }
            
            task.resume()
        } else {
            completion([])
        }
    }

}

