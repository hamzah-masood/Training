//
//  ViewController.swift
//  toDoProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, toDoDetailViewControllerDelegate, NextViewControllerDelegate {
  
  @IBOutlet weak var darkModeSwitch: UISwitch!
  
  @IBAction func isDarkModeEnabled(_ sender: Any) {
    isDarkModeEnabled = !isDarkModeEnabled
  }
  
  var isDarkModeEnabled: Bool  {
    get {
      return UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "isDarkModeEnabled")
      updateUI()
    }
  }
  
  private func updateUI() {
    if isDarkModeEnabled {
      //toDoTable.textColor = .white
      view.backgroundColor = .black
      toDoTable.backgroundColor = .black
      toDoTable.reloadData()
      
    } else {
      //toDoTable.textColor = .black
      view.backgroundColor = .white
      toDoTable.backgroundColor = .white
      toDoTable.reloadData()
    }
  }
  
  
  var wholeList: [ToDo] = []
  var toDoArray: [String] = []
  
  
  func updateString(with value: String) {
    guard let selectedRow = toDoTable.indexPathForSelectedRow?.row else {return}
    toDoArray[selectedRow] = value
    toDoTable.reloadData()
  }
  func updateArray(with value: [ToDo]) {
    toDoArray = []
    let arrayOfToDoList = value
    for items in arrayOfToDoList {
      guard let whatToDo = items.whatToDo else { return }
      toDoArray.append(whatToDo)
    }
    toDoTable.reloadData()
  }
  
  

  @IBOutlet weak var toDoTable: UITableView!
  
  let stuff = CoreDataStuff()
  

  
  @IBAction func addToDo(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    nextViewController.delegate = self
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    darkModeSwitch.isOn = isDarkModeEnabled
    updateUI()
    toDoTable.dataSource = self
    toDoTable.delegate = self
    toDoTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    // Do any additional setup after loading the view.
    
    wholeList = stuff.getAllToDo()
    
    for ToDo in wholeList {
      //print(ToDo.whatToDo)
      guard let name = ToDo.whatToDo else { return }
      toDoArray.append(name)
    }
  
    
  }
}

extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoArray.count//stuff.getAllToDo().count
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
    toDoDetailViewController.arrayIndex = indexPath.row
  
    navigationController?.pushViewController(toDoDetailViewController, animated: true)

  }

}
