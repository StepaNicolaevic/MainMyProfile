//
//  parsingURL.swift
//  trenirovkf
//
//  Created by qeqwe on 23.11.2023.
//

import Foundation

struct Response: Decodable {
    let characters: [Hero]
    
    private enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
    
    init(characters: [Hero]) {
        self.characters = characters
    }
}

struct Hero: Codable {
    let id: Int?
    let name: String?
    let status: Status
    let species: Species
    let type: String?
    let gender: Gender?
    let origin, location: Location
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


 
