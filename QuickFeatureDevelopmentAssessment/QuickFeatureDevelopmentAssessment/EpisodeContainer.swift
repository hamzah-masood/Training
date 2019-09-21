//
//  EpisodeContainer.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct EpisodeContainer: Codable {
  let episodes: [Episode]
  
  enum EpisodeCodingKeys: String, CodingKey {
    case episodes
  }
  
  
  
  enum TopLevelCodingKeys: String, CodingKey {
    case topLevel = "_embedded"
  }
  
  init(from decoder: Decoder) throws {
    let topContainer = try decoder.container(keyedBy: TopLevelCodingKeys.self)
    let subContainer = try topContainer.nestedContainer(keyedBy: EpisodeCodingKeys.self, forKey: .topLevel)
    self.episodes = try subContainer.decode([Episode].self, forKey: .episodes)
    
  }
  
  init(array: [Episode]) {
   episodes = array
  }
  func encode(to encoder: Encoder) throws {
    var topContainer = encoder.container(keyedBy: TopLevelCodingKeys.self)
    var subContainer = topContainer.nestedContainer(keyedBy: EpisodeCodingKeys.self, forKey: .topLevel)
    try subContainer.encode(episodes, forKey: .episodes)
  }
}

struct Episode: Codable {
  let airDate: String
  let airStamp: String
  let name: String
  let runtime: Int
  let summary: String
  let image: String
  
  enum CodingKeys: String, CodingKey {
    case airDate = "airdate"
    case airStamp = "airstamp"
    case name
    case runtime
    case summary
    case image

  }
  
  enum imageCodingKeys: String, CodingKey {
    case original
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let imageContainer = try container.nestedContainer(keyedBy: imageCodingKeys.self, forKey: .image)
    self.airDate = try container.decode(String.self, forKey: .airDate)
    self.airStamp = try container.decode(String.self, forKey: .airStamp)
    self.name = try container.decode(String.self, forKey: .name)
    self.runtime = try container.decode(Int.self, forKey: .runtime)
    self.summary = try container.decode(String.self, forKey: .summary)
    self.image = try imageContainer.decode(String.self, forKey: .original)
  }
  init() {
    airDate = "2019"
    airStamp = "2018"
    name = "Where the gang goes fishing"
    runtime = 28
    summary = "the gang goes fishing in central Park"
    image = "string"
  }
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var imageContainer = container.nestedContainer(keyedBy: imageCodingKeys.self, forKey: .image)
    try container.encode(airDate, forKey: .airDate)
    try container.encode(airStamp, forKey: .airStamp)
    try container.encode(name, forKey: .name)
    try container.encode(runtime, forKey: .runtime)
    try container.encode(summary, forKey: .summary)
    try imageContainer.encode(image, forKey: .original)
  }
  
}

