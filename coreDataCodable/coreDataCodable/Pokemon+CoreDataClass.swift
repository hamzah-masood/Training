//
//  Pokemon+CoreDataClass.swift
//  coreDataCodable
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject, Codable {
  
  
  
  enum CodingKeys: String, CodingKey{
    case name
  }
  
  public convenience required init(from decoder: Decoder) throws {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Pokemon", in: CoreDataManager.shared.context) else { throw CoreDataError.noSuchEntity}
    self.init(entity: entityDescription, insertInto: CoreDataManager.shared.context)
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
  }
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
  }
  

}

enum CoreDataError: Error {
  case noSuchEntity
}
