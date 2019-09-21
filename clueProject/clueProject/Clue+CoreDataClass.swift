//
//  Clue+CoreDataClass.swift
//  clueProject
//
//  Created by MCS on 8/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//
import Foundation
import CoreData

@objc(Clue)
public class Clue: NSManagedObject, Codable {
  
  enum CodingKeys: String, CodingKey {
    case answer
    case question
    case value = "value"
    case category
    case airDate = "airdate"
    case creationDate = "created_at"
  }
  
  enum categoryCodingKeys: String, CodingKey{
    case category = "title"
  }
  
  public convenience required init(from decoder: Decoder) throws {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Clue", in: ClueDataManager.shared.context) else { throw ClueDataError.noSuchEntity}
    self.init(entity: entityDescription, insertInto: nil)
    
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let categoryContainer = try container.nestedContainer(keyedBy: categoryCodingKeys.self, forKey: .category)
    answer = try container.decode(String.self, forKey: .answer)
    question = try container.decode(String.self, forKey: .question)
    category = try categoryContainer.decode(String.self, forKey: .category)
    airDate = try container.decode(String.self, forKey: .airDate)
    creationDate = try container.decode(String.self, forKey: .creationDate)
    
    
    if let intValue = try container.decodeIfPresent(Int.self, forKey: .value) {
      value = NSNumber(integerLiteral: intValue)
    } else {
      value = nil
    }
    
    
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var categoryContainer = container.nestedContainer(keyedBy: categoryCodingKeys.self, forKey: .category)
    try container.encode(answer, forKey: .answer)
    try container.encode(question, forKey: .question)
    try categoryContainer.encode(category, forKey: .category)
    try container.encode(airDate, forKey: .airDate)
    try container.encode(creationDate, forKey: .creationDate)
    try container.encode(value?.intValue, forKey: .value)
    
    
  }
  
}
