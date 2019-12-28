//
//  NextViewController.swift
//  toDoProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData
//import RealmSwift

protocol NextViewControllerDelegate {
  func updateArray(with value: [ToDo])
}

class NextViewController: UIViewController {

  @IBOutlet weak var toDoItem: UITextField!
  
  let realm = try! Realm()
  let stuff = CoreDataStuff()
  var makeToDoItem: String?
  var delegate: NextViewControllerDelegate?
  
  @IBAction func submit(_ sender: Any) {
    
    makeToDoItem = toDoItem.text
    
    try? stuff.toDo(whatToDo: makeToDoItem ?? "")
    stuff.save()
    
    let newList = stuff.getAllToDo()
    delegate?.updateArray(with: newList)
    
//    try! realm.write {
//      realm.add(ToDo)
//    }
    
    navigationController?.popViewController(animated: true)
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    //makeToDoItem = toDoItem.text
        
    }
    

}
