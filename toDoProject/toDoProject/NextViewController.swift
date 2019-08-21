//
//  NextViewController.swift
//  toDoProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData

class NextViewController: UIViewController {

  @IBOutlet weak var toDoItem: UITextField!
  
  let stuff = CoreDataStuff()
  var makeToDoItem: String?
  
  @IBAction func submit(_ sender: Any) {
    
    makeToDoItem = toDoItem.text
    
    try? stuff.toDo(whatToDo: makeToDoItem ?? "")
    stuff.save()
    
    
    
    navigationController?.popViewController(animated: true)
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

    //makeToDoItem = toDoItem.text
        
    }
    

}
