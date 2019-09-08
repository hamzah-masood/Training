////
////  imageContainer.swift
////  pixabayProject
////
////  Created by MCS on 9/5/19.
////  Copyright © 2019 MCS. All rights reserved.
////
//
//import Foundation
//
//struct ImageContainer: Decodable {
//  let image: [Image]
//  
//  
//  enum CodingKeys: String, CodingKey {
//    case dictionary = "hits"
//  }
//  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    //let imageContainer = try topContainer.nestedContainer(keyedBy: Image.ImageCodingKeys.self, forKey: .dictionary)
//    image = try container.decode([Image].self, forKey: .dictionary)
//    
//    //************************************
//    
//  }
//}
