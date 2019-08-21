//
//  ViewController.swift
//  toDoProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, toDoDetailViewControllerDelegate {
  
  var wholeList: [ToDo] = []
  var toDoArray: [String] = []
  
  
  func updateString(with value: String) {
    guard let selectedRow = toDoTable.indexPathForSelectedRow?.row else {return}
    toDoArray[selectedRow] = value
    toDoTable.reloadData()
  }
  
  
  

  @IBOutlet weak var toDoTable: UITableView!
  
  let stuff = CoreDataStuff()
  

  
  @IBAction func addToDo(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    toDoTable.dataSource = self
    toDoTable.delegate = self
    toDoTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    // Do any additional setup after loading the view.
    
    wholeList = stuff.getAllToDo()
    
    for ToDo in wholeList {
      //print(ToDo.whatToDo)
      toDoArray.append(ToDo.whatToDo ?? "")
    }
    
    //delegation of updating string from nextViewController
//    func updateString(with value: String){
//      guard let selectedRow = toDoTable.indexPathForSelectedRow?.row else {return}
//      toDoArray[selectedRow] = value
//      toDoTable.reloadData()
//    }
    
  }
}

extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return wholeList.count//stuff.getAllToDo().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    
    cell.textLabel?.text = toDoArray[indexPath.row]
    
    return cell
  }
  
  
}

extension ViewController: UITableViewDelegate{

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //assigning main storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //assigning next screen that is already on storyboard
    let toDoDetailViewController = storyboard.instantiateViewController(withIdentifier: "toDoDetailViewController") as! toDoDetailViewController

    let tappedString = toDoArray[indexPath.row]
    toDoDetailViewController.editString = tappedString
    toDoDetailViewController.delegate = self
    let tappedElement = wholeList[indexPath.row]
    toDoDetailViewController.deleteElement = tappedElement
    
    
    //navigation controller pushes our (nextviewcontroller) on top if main storyboard,
    //automatically creating a back button
    navigationController?.pushViewController(toDoDetailViewController, animated: true)

  }

}
