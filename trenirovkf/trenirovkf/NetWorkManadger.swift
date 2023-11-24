//
//  NetorkManager.swift
//  trenirovkf
//
//  Created by qeqwe on 22.11.2023.
//

import Foundation

final class NetWorkManager {
    private let sessionConfiguation = URLSessionConfiguration.default

    func obtainСartoonСharacters(completion: @escaping ([Hero]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let character = try JSONDecoder().decode(Response.self, from: data)
                    
                    completion(character.characters)
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
    func fullInfoCharacter(id: Int, completion: @escaping(Hero) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error:\(error)")
            } else if let data = data {
                do {
                    let character = try JSONDecoder().decode(Hero.self, from: data)
                    
                    completion(character)
                } catch {
                    print("error")
                }
            }
        }
        task.resume()
    }
}
