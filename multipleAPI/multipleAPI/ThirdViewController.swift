//
//  thirdViewController.swift
//  multipleAPI
//
//  Created by MCS on 8/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  @IBOutlet weak var thirdTable: UITableView!
  
  
  var updatedTouple: MyTouple?
  var mySet: [Results] = []
  
  func setUpThirdViewController(secondTouple: MyTouple) {
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
        self.thirdTable.reloadData()
      }
      }.resume()
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      thirdTable.dataSource = self
      thirdTable.delegate = self
      thirdTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      

        // Do any additional setup after loading the view.
    }

}


extension ThirdViewController: UITableViewDataSource {
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

extension ThirdViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //main storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //assigning next screen
    let fourthViewController = storyboard.instantiateViewController(withIdentifier: "fourthViewController") as! FourthViewController
    
    
    
    
    if let index = self.thirdTable.indexPathForSelectedRow {
      self.thirdTable.deselectRow(at: index, animated: true)
    }
    
    
    navigationController?.pushViewController(fourthViewController, animated: true)
  }
}


