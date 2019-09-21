//
//  Image+CoreDataClass.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Image)
public class Image: NSManagedObject, Codable {
  
//  enum CodingKeys: String, CodingKey {
//    case hits
//  }

  enum ImageCodingKeys: String, CodingKey {
    case url = "webformatURL"
    case views
    case likes
    case comments
    case user
    //case isFavorited
  }
  
    public convenience required init(from decoder: Decoder) throws {
      guard let entityDescription = NSEntityDescription.entity(forEntityName: "Image", in: CoreDataManager.shared.context) else { throw CoreDataError.noSuchEntity}
      self.init(entity: entityDescription, insertInto: CoreDataManager.shared.context)
  
      let container = try decoder.container(keyedBy: ImageCodingKeys.self)
//      let imageContainer = try container.nestedContainer(keyedBy: ImageCodingKeys.self, forKey: .hits)
      user = try container.decode(String.self, forKey: .user)
      url = try container.decode(String.self, forKey: .url)
      //isFavorited = try container.decode(Bool.self, forKey: .isFavorited)
      
      if let viewsValue = try container.decodeIfPresent(Int.self, forKey: .views) {
        views = NSNumber(integerLiteral: viewsValue)
      }
      if let likesValue = try container.decodeIfPresent(Int.self, forKey: .likes) {
        likes = NSNumber(integerLiteral: likesValue)
      }
      if let commentsValue = try container.decodeIfPresent(Int.self, forKey: .comments) {
        comments = NSNumber(integerLiteral: commentsValue)
      } 
  }
  
  enum CoreDataError: Error {
    case noSuchEntity
  }

  
}
