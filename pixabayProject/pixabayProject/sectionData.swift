////
////  sectionData.swift
////  pixabayProject
////
////  Created by MCS on 9/3/19.
////  Copyright © 2019 MCS. All rights reserved.
////
//
//import Foundation
//
//final class sectionData {
//  
//  let imagesArray: [Image] = []
//  
//  URLSession.shared.dataTask(with: URL(string: "https://pixabay.com/api/?key=\(apiKey)&q=sunset&image_type=photo&pretty=true")!) { (data, response, _) in
//  guard let data = data else { return }
//  let imagesContainer = try? JSONDecoder().decode(ImageContainer.self, from: data)
//  guard let newImagesContainer = imagesContainer else {
//  print("Something went wrong")
//  return
//  }
//  self.imagesArray = newImagesContainer.image
//  
//  print(self.imagesArray)
//  
//  do {
//  try CoreDataManager.shared.context.save()
//  } catch {
//  print(error.localizedDescription)
//  }
//  DispatchQueue.main.async {
//  self.mainTable.reloadData()
//  }
//  
//  }.resume()
//}
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
