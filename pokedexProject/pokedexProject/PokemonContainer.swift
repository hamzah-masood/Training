//
//  PokemonContainer.swift
//  pokedexProject
//
//  Created by mcs on 12/13/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let experience: Int
    let forms:[Form]
    let abilities: [Abilities]
    let moves: [Moves]
    let types: [Types]
    let imageInfo: ImageInfo
    let stats: [Stats]
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case experience = "base_experience"
        case forms
        case abilities
        case moves
        case types
        case imageInfo = "sprites"
        case stats
    }
}

struct Form: Decodable {
    let name: String
    
    enum formCodingKeys: String, CodingKey {
        case name
    }
}

struct Abilities: Decodable {
    let ability: String
    
    enum CodingKeys: String, CodingKey {
        case ability
    }
    enum abilityCodingKeys: String, CodingKey {
        case name
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let abilityContainer = try container.nestedContainer(keyedBy: abilityCodingKeys.self, forKey: .ability)
      ability = try abilityContainer.decode(String.self, forKey: .name)
    }
    
}

struct Moves: Decodable {
    let move: String
    
    enum CodingKeys: String, CodingKey {
        case move
    }
    enum moveCodingKeys: String, CodingKey {
        case name
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let moveContainer = try container.nestedContainer(keyedBy: moveCodingKeys.self, forKey: .move)
      move = try moveContainer.decode(String.self, forKey: .name)
    }
}

struct Types: Decodable {
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    enum typeCodingKeys: String, CodingKey {
        case name
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let typeContainer = try container.nestedContainer(keyedBy: typeCodingKeys.self, forKey: .type)
      type = try typeContainer.decode(String.self, forKey: .name)
    }
}

struct ImageInfo: Decodable {
    
  let urlString: String
  
  enum CodingKeys: String, CodingKey {
    case urlString = "front_default"
  }
}

struct Stats: Decodable {
    let stat: String
    
    enum CodingKeys: String, CodingKey {
        case stat
    }
    enum statCodingKeys: String, CodingKey {
        case name
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let statContainer = try container.nestedContainer(keyedBy: statCodingKeys.self, forKey: .stat)
      stat = try statContainer.decode(String.self, forKey: .name)
    }
}


