//
//  categoryContainer.swift
//  abercrombieProject
//
//  Created by mcs on 9/24/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let title: String?
    let backgroundImage: String?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
    let content: [Content]?

  
    enum CodingKeys: String, CodingKey {
        case title
        case backgroundImage
        case promoMessage
        case topDescription
        case bottomDescription
        case content
    }

  
    init(from decoder: Decoder) throws {
        

        let container = try decoder.container(keyedBy: CodingKeys.self)
        //let contentContainer = try container.nestedContainer(keyedBy: ContenCodingKeys.self, forKey: .content)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        promoMessage = try container.decodeIfPresent(String.self, forKey: .promoMessage)
        topDescription = try container.decodeIfPresent(String.self, forKey: .topDescription)
        bottomDescription = try container.decodeIfPresent(String.self, forKey: .bottomDescription)
        content = try container.decodeIfPresent([Content].self, forKey: .content)
        
    }
}
struct Content: Decodable {
    let target: String?
    let title: String?
  
  enum ContenCodingKeys: String, CodingKey {
      case target
      case title
  }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContenCodingKeys.self)
        target = try container.decodeIfPresent(String.self, forKey: .target)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        
    }
    
}
  

