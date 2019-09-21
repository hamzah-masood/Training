//
//  ViewController.swift
//  clueProject
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//
import UIKit
import CoreData

class ViewController: UIViewController, MyCellDelegate {
  func getFavoritedClue(with value: Clue) {
    
  }
  
  func updateArray(with value: [Clue]) {
    updatedArray = []
    let arrayOfFavorites = value
    for items in arrayOfFavorites {
      updatedArray.append(items)
    }
    clueTable.reloadData()
  }
  
  var updatedArray: [Clue] = []
  //var stuff = ClueDataManager()
  
  @IBOutlet weak var clueTable: UITableView!
  
  
  var clue: [Clue] = []
  var wifiConnection = false
  var favoritedArray = ClueDataManager.shared.getAllClues() //stuff.getAllClue()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    
    clueTable.dataSource = self
    clueTable.delegate = self
    //clueTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    clueTable.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    //clueTable.register(ClueCell.self, forCellReuseIdentifier: "cell")
    
    URLSession.shared.dataTask(with: URL(string: "http://jservice.io/api/clues")!) { (data, response, error) in
      if error == nil {
        self.wifiConnection = true
      }
      guard let data = data else { return }
      let clue = try? JSONDecoder().decode([Clue].self, from: data)
      guard let allClue = clue else {
        
        print("Something went wrong")
        return
      }
      
      self.clue = allClue
      
      
      self.updatedArray = clue.self ?? []
      
      
      
      DispatchQueue.main.async {
        self.clueTable.reloadData()
      }
      }.resume()
    
    if wifiConnection == false{
      
      self.clue = ClueDataManager.shared.getAllClues()//stuff.getAllClues()
      print(self.clue)
      clueTable.reloadData()
    }
  }
}

//struct Answer: Codable {
//  let answer:String
//}
//struct Clue: Decodable {
//  let answer:String?
//  let question: String?
//  let value: Int?
//  let category: String?
//  let airDate: String?
//  let creationDate: String?
//
//
//  enum CodingKeys: String, CodingKey {
//    case answer
//    case question
//    case value = "value"
//    case category
//    case airDate = "airdate"
//    case creationDate = "created_at"
//  }
//
//  enum categoryCodingKeys: String, CodingKey{
//    case category = "title"
//  }
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    let categoryContainer = try container.nestedContainer(keyedBy: categoryCodingKeys.self, forKey: .category)
//    answer = try container.decode(String.self, forKey: .answer)
//    question = try container.decode(String.self, forKey: .question)
//    value = try? container.decode(Int.self, forKey: .value)
//    category = try categoryContainer.decode(String.self, forKey: .category)
//    airDate = try container.decode(String.self, forKey: .airDate)
//    creationDate = try container.decode(String.self, forKey: .creationDate)
//  }
//}
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return clue.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = clue[indexPath.row].question == ""
      ? "No Question, Only Answer"
      : clue[indexPath.row].question
    //+ "/" + clue[indexPath.row].answer + "/" + clue[indexPath.row].category + "/" + clue[indexPath.row].airDate + "/" + clue[indexPath.row].creationDate
    
    if clue[indexPath.row].isFavorited == true {
      cell.backgroundColor = .red
    }
    
    
    cell.selectedCell = clue[indexPath.row]
    cell.cellAnswer = clue[indexPath.row].answer
    cell.cellQuestion = clue[indexPath.row].question
    cell.cellValue = clue[indexPath.row].value
    cell.cellAirDate = clue[indexPath.row].airDate
    cell.cellTitle = clue[indexPath.row].category
    cell.cellCreationAt = clue[indexPath.row].creationDate
    
    return cell
  }
  
}

extension ViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //main storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //assigning next screen
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
    
    
    nextViewController.updatedQuestion = clue[indexPath.row].question
    nextViewController.updatedAnswer = clue[indexPath.row].answer
    nextViewController.updatedCategory = clue[indexPath.row].category
    nextViewController.updatedValue = clue[indexPath.row].value?.intValue
    nextViewController.updatedAirDate = clue[indexPath.row].airDate
    nextViewController.updatedCreationDate = clue[indexPath.row].creationDate
    
    
    
    
    if let index = self.clueTable.indexPathForSelectedRow {
      self.clueTable.deselectRow(at: index, animated: true)
    }
    
    navigationController?.pushViewController(nextViewController, animated: true)
    
  }
}
