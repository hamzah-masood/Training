//
//  categoryViewModel.swift
//  abercrombieProject
//
//  Created by mcs on 9/24/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import Foundation

protocol Session {
  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?)
}
extension URLSession: Session {
  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
    dataTask(with: url) { (data, _, error) in
      completion?(data, error)
    }.resume()
  }
}

class categoryViewModel {
    private var categories = [Category]()
    let abercrombieURL = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"

//
//    func getData() {
//        URLSession.shared.dataTask(with: URL(string: "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json")!) { (data, response, error) in
//        guard let data = data else { return }
//        let categoryArray = try? JSONDecoder().decode([Category].self, from: data)
//        guard let allCategories = categoryArray else {
//
//          print("Something went wrong")
//          return
//        }
//
//        self.categories = allCategories
//
//            print(self.categories)
//
//
//
//        }.resume()
//    }
    func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
        guard let abercrombieURL = URL(string: self.abercrombieURL) else {
         completion?()
         return
       }
       session.getData(from: abercrombieURL) { [weak self] (data, error) in
         defer { completion?() }
         guard let data = data,
           error == nil,
           let categoryArray = try? JSONDecoder().decode([Category].self, from: data) else { return }
        self?.categories = categoryArray
         }
     }
    
    func category(for index: Int) -> Category {
      return self.categories[index]
    }
    
    func numberOfCategoriess() -> Int {
        return categories.count
        //self.episodes.count
    }

}
