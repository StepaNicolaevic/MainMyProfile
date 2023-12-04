//
//  NetWorkManadger.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import Foundation

final class NetWorkManager {
    
    private let sessionConfiguation = URLSessionConfiguration.default
    
    func informationOfEpisode(completion: @escaping([numberEpisod]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error:\(error)")
            } else if let data = data {
                do {
                    let episod = try JSONDecoder().decode(Epiode.self, from: data)
                    completion(episod.episodes)
                } catch {
                    print("error")
                }
            }
        }
        task.resume()
    }
    
    func fullInfoCharacter(url: String, completion: @escaping(Hero) -> Void) {
        
        guard let url = URL(string: "\(url)") else {
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
    


