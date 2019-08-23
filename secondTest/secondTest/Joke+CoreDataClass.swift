//
//  Joke+CoreDataClass.swift
//  secondTest
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Joke)
public class Joke: NSManagedObject, Codable {
  
  
  enum CodingKeys: String, CodingKey{
    case category
    case type
    case id
    
    case joke
 
    case setup
    case delivery

  }
  
  public convenience required init(from decoder: Decoder) throws {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Joke", in: CoreDataManager.shared.context) else { throw CoreDataError.noSuchEntity}
    self.init(entity: entityDescription, insertInto: CoreDataManager.shared.context)
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    category = try container.decode(String.self, forKey: .category)
    type = try container.decode(String.self, forKey: .type)
    joke = try? container.decode(String.self, forKey: .joke)
    setup = try? container.decode(String.self, forKey: .setup)
    delivery = try? container.decode(String.self, forKey: .delivery)
    
    if let intValue = try container.decodeIfPresent(Int.self, forKey: .id) {
      id = NSNumber(integerLiteral: intValue)
    } else {
      id = nil
    }
    
  }
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(category, forKey: .category)
    try container.encode(type, forKey: .type)
    try container.encode(id?.intValue, forKey: .id)
    
    if type.contains("single") {
      try? container.encode(joke, forKey: .joke)
    }
    
    else if type.contains("twopart") {
      try? container.encode(setup, forKey: .setup)
      try? container.encode(delivery, forKey: .delivery)
    }
    
    
  }
  
}


enum CoreDataError: Error {
  case noSuchEntity
}

