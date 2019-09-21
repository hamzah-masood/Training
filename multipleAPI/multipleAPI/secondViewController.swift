//
//  secondViewController.swift
//  multipleAPI
//
//  Created by MCS on 8/17/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
  
  @IBOutlet weak var secondTable: UITableView!
  
  var updatedTouple: MyTouple?
  
  var mySet: [Results] = []
  
  func setUpSecondViewController(secondTouple: MyTouple) {
    guard let url = updatedTouple?.url else {return}
      URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, _) in
      guard let data = data else { return }
      let firstSet = try? JSONDecoder().decode(SecondAPIs.self, from: data)

        print(firstSet)
        guard let allAPI = firstSet else {
        print("Something went wrong")
        return
      }

        self.mySet = allAPI.results
        
      
      DispatchQueue.main.async {
        self.secondTable.reloadData()
      }
      }.resume()

  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      secondTable.dataSource = self
      secondTable.delegate = self
      secondTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

      // Do any additional setup after loading the view.
      
      
    }

}


extension secondViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mySet.count //secondArray.count //count of episodes
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = mySet[indexPath.row].name//"\(secondArray[indexPath.row].title)"
    return cell
  }
  
}

extension secondViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //main storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //assigning next screen
    let thirdViewController = storyboard.instantiateViewController(withIdentifier: "thirdViewController") as! ThirdViewController
    
//    thirdViewController.updatedTouple = mySet[indexPath.row]
//    thirdViewController.setUpThirdViewController(secondTouple: mySet[indexPath.row])
    
    if let index = self.secondTable.indexPathForSelectedRow {
      self.secondTable.deselectRow(at: index, animated: true)
    }
    
    
    navigationController?.pushViewController(thirdViewController, animated: true)
  }
}

struct Results: Codable {
  let name: String
  let url: String
}
struct SecondAPIs: Codable {
  let results: [Results]
}
