////
////  imagesViewModel.swift
////  pixabayProject
////
////  Created by MCS on 9/5/19.
////  Copyright © 2019 MCS. All rights reserved.
////
//
//import Foundation
//
//final class imagesViewModel {
//  let apiKey = "13466062-6ac6987f27cfb51eb71fee381"
//  var imagesArray: [Image] = []
//  
//  func getData(_ completion: (() -> Void)?) {
//    
//    URLSession.shared.dataTask(with: URL(string: "https://pixabay.com/api/?key=\(apiKey)&q=sunset&image_type=photo&pretty=true")!) { (data, response, _) in
//    guard let data = data else { return }
//    let imagesContainer = try? JSONDecoder().decode(ImageContainer.self, from: data)
//    guard let newImagesContainer = imagesContainer else {
//    print("Something went wrong")
//    return
//    }
//    self.imagesArray = newImagesContainer.image
//  
//    print(self.imagesArray)
//  
//    do {
//    try CoreDataManager.shared.context.save()
//    } catch {
//    print(error.localizedDescription)
//    }
//
//  
//    }.resume()
//  }
//  
//  func numberOfImages() -> Int {
//    return self.imagesArray.count
//  }
//
//}
//
////func getData(_ completion: (() -> Void)?) {
////  guard let firstCategoryUrl = URL(string: self.firstCategoryURL) else {
////    completion?()
////    return
////  }
////  URLSession.shared.dataTask(with: firstCategoryUrl) { data, _,  error in
////    defer { completion?() }
////    guard let data = data,
////      error == nil,
////      let newImages = try? JSONDecoder().decode(NewImages.self, from: data) else { return }
////    self.images = newImages.hits
////    }.resume()
////}
////
////func numberOfImages() -> Int {
////  return self.images.count
////}
////
////func image(for index: Int) -> Image {
////  return self.images[index]
////}
