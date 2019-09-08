//
//  ViewController.swift
//  HIMYMProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var mainTable: UITableView!
  var characterArray: [Character] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    mainTable.dataSource = self
    mainTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    
    
    URLSession.shared.dataTask(with: URL(string: "https://api.duckduckgo.com/?q=how%20i%20met%20your%20mother%20characters&format=json&pretty=1")!) { (data, response, _) in
      guard let data = data else { return }
      let howIMetYourMother = try? JSONDecoder().decode(CharacterAPIResponse.self, from: data)
      self.characterArray = howIMetYourMother?.characterArray ?? []
      
      print(self.characterArray)
      
      DispatchQueue.main.async {
        self.mainTable.reloadData()
      }
      }.resume()
  }


}

extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characterArray.count
  }
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = characterArray[indexPath.row].nameDescriptionTuple.name
    return cell
  }
}

public struct CharacterAPIResponse: Decodable {
  
  public let characterArray: [Character]
  
  enum CodingKeys: String, CodingKey {
    case characterArray = "RelatedTopics"
  }
}

public struct Character: Decodable {
  
  let result: String
  let text: String
  let imageInfo: ImageInfo
//  var name: String {
//    return text.components(separatedBy: " - ")[0]
//  }
//  var description: String {
//    return text.components(separatedBy: " - ")[1]
//  }
  var nameDescriptionTuple: (name: String, description: String) {
    let infoArray = text.components(separatedBy: " - ")
    return (infoArray[0], infoArray[1])
  }

  
  enum CodingKeys: String, CodingKey {
    case result = "Result"
    case text = "Text"
    case imageInfo = "Icon"
  }
}

public struct ImageInfo: Decodable {
  let urlString: String
  
  enum CodingKeys: String, CodingKey {
    case urlString = "URL"
  }
}

//struct Character: Codable {
//  let result: String
//  let text: String
//  let icon: String = ""
//  let URL: String
//
//  enum CodingKeys: String, CodingKey {
//    case result = "Result"
//    case text = "Text"
//    case icon = "Icon"
//  }
//  enum imageCodingKeys: String, CodingKey {
//    case URL
//  }
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    result = try container.decode(String.self, forKey: .result)
//    text = try container.decode(String.self, forKey: .text)
//    let subcontainer = try container.nestedContainer(keyedBy: imageCodingKeys.self, forKey: .icon)
//    URL = try subcontainer.decode(String.self, forKey: .URL)
//  }
//}
//
//struct HIMYM: Codable {
//  let people: [Character]
//
//  enum CodingKeys: String, CodingKey {
//    case people = "RelatedTopics"
//  }
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    people = try container.decode([Character].self, forKey: .people)
//  }
//}


  

