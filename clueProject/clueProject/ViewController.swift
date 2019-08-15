//
//  ViewController.swift
//  clueProject
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
  @IBOutlet weak var clueTable: UITableView!
  
  var clue: [Clue] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    clueTable.dataSource = self
    clueTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    
    
    URLSession.shared.dataTask(with: URL(string: "http://jservice.io/api/clues")!) { (data, response, _) in
      guard let data = data else { return }
      let clue = try? JSONDecoder().decode([Clue].self, from: data)
      guard let allClue = clue else {
        print("Something went wrong")
        return
      }
      self.clue = allClue
      //          print(data)
      //          print(clue)
      
      DispatchQueue.main.async {
        self.clueTable.reloadData()
      }
      }.resume()
  }
}

//struct Answer: Codable {
//  let answer:String
//}

struct Clue: Codable {
  let answer:String
  let question: String
  //let value: Int
  let category: String
  
  
  enum CodingKeys: String, CodingKey {
    case answer
    case question
    //case value
    case category
  }
  
  enum categoryCodingKeys: String, CodingKey{
    case category = "title"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let categoryContainer = try container.nestedContainer(keyedBy: categoryCodingKeys.self, forKey: .category)
    answer = try container.decode(String.self, forKey: .answer)
    question = try container.decode(String.self, forKey: .question)
    //value = try container.decode(Int.self, forKey: .value)
    category = try categoryContainer.decode(String.self, forKey: .category)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return clue.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = clue[indexPath.row].question + "/" + clue[indexPath.row].answer + "/" + clue[indexPath.row].category
    return cell
  }
  
}
