//
//  ParsingURL.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import Foundation


struct Epiode: Decodable {
    let episodes: [numberEpisod]
    private enum CodingKeys: String, CodingKey {
        case episodes = "results"
    }
    
    init(episodes: [numberEpisod]) {
        self.episodes = episodes
    }
}

struct numberEpisod: Decodable {
    let id: Int
    let name: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
}

struct Hero: Codable {
    let name: String
    let id: Int
    let status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
}

struct Location: Codable {
    let name: String
    let url: String
}

struct EpisodeAndCharacter {
    let id: Int
    let name: String
    let episode: String
    let characters: Hero
    let url: String
    let created: String
}

struct getInfoCharacter {
    let header: String
    let characteristic: String
}

public class DataManager {
    static let shared = DataManager()
    
    var selectedData: [EpisodeAndCharacter] = []
    func append(model: EpisodeAndCharacter) {
        
        if selectedData.isEmpty {
            selectedData.append(model)
            
        }
        else {
            for (index, op) in selectedData.enumerated() {
                if op.id == model.id {
                    selectedData.remove(at: index)
                    return
                    
                }
            }
            selectedData.append(model)
        }
        
    }
}
