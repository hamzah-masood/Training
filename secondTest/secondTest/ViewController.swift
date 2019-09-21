//
//  ViewController.swift
//  secondTest
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var jokesTableView: UITableView!
  var jokesArray: [Joke] = []
  var displayedJokes: [Joke] = []
  
  var favoritesArray: [Joke] = []

  @IBOutlet weak var selectCategoryControl: UISegmentedControl!
  
  @IBAction func selectCategory(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      jokesArray = []
      let anyJokes = CoreDataManager.shared.getAllJokes()
      jokesArray = anyJokes
      jokesTableView.reloadData()
    case 1:
      jokesArray = []
      let miscJokes = CoreDataManager.shared.getAllJokes()
      let word = "Miscellaneous"
      for joke in miscJokes {
        if joke.category.contains(word) {//joke.type == "Miscellaneous" {
          jokesArray.append(joke)
        }
      }
      jokesTableView.reloadData()
      
    case 2:
      displayedJokes = jokesArray.filter( { $0.category == "Dark"} )
      jokesArray = []
      let darkJokes = CoreDataManager.shared.getAllJokes()
      let darkWord = "Dark"
      for joke in darkJokes {
        if joke.category.contains(darkWord) {
          jokesArray.append(joke)
        }
      }
      jokesTableView.reloadData()
    case 3:
      jokesArray = CoreDataManager.shared.getAllJokes().filter( { $0.category == "Programming" } )
//      for joke in programmingJokes {
//        if joke.category == "Programming" {
//          jokesArray.append(joke)
//        }
//      }
      jokesTableView.reloadData()
    case 4:
      jokesArray = []
      let favoritedJokes = CoreDataManager.shared.getAllJokes().filter( { $0.isFavorited == true } )
      for joke in favoritedJokes {
          jokesArray.append(joke)
      }
      jokesTableView.reloadData()
      
    default:
      break
    }
    
  }
  
  
  
  
  @IBAction func addJoke(_ sender: Any) {
    URLSession.shared.dataTask(with: URL(string: "https://sv443.net/jokeapi/category/Any?blacklistFlags=nsfw")!) { (data, response, _) in
      guard let data = data else { return }
      let joke = try? JSONDecoder().decode(Joke.self, from: data)
      guard let newJoke = joke else {
        print("Something went wrong")
        return
      }
      print(newJoke)
      
      self.jokesArray.append(newJoke)
      
      do {
        try CoreDataManager.shared.context.save()
      } catch {
        print(error.localizedDescription)
      }
      DispatchQueue.main.async {
        self.jokesArray = CoreDataManager.shared.getAllJokes()
        self.jokesTableView.reloadData()
      }
      
      }.resume()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    jokesTableView.dataSource = self
//    jokesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    jokesTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    
    self.jokesArray = CoreDataManager.shared.getAllJokes()
    self.jokesTableView.reloadData()
    // Do any additional setup after loading the view.
    
    
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jokesArray.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
    if (cell == nil)
    {
      cell = MyTableViewCell(style: UITableViewCell.CellStyle.subtitle,
                             reuseIdentifier: "cell")
    }
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping

    
        cell.selectedCell = jokesArray[indexPath.row]

    
    if jokesArray[indexPath.row].joke == nil {
      let setup = jokesArray[indexPath.row].setup ?? ""
      let delivery = jokesArray[indexPath.row].delivery ?? ""
      //cell.textLabel?.text = setup
      //cell.detailTextLabel?.text = delivery
      cell.jokeLAbel?.text = setup + "\n" + delivery
    }
    else {
    //cell.textLabel?.text = jokesArray[indexPath.row].joke
      cell.jokeLAbel?.text = jokesArray[indexPath.row].joke
    }
    
    
    if jokesArray[indexPath.row].isFavorited == true {
      cell.backgroundColor = .red
    }
    
    return cell
  }
}

//extension ViewController: UITableViewDelegate {
//  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//    cell.selectedCell = jokesArray[indexPath.row]
//
//  }
//}
