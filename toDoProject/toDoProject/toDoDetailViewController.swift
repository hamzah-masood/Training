//
//  toDoDetailViewController.swift
//  toDoProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import  CoreData

protocol toDoDetailViewControllerDelegate {
  func updateString(with value: String)
}


class toDoDetailViewController: UIViewController {
  
  var editString: String?
  var delegate: toDoDetailViewControllerDelegate?


  @IBOutlet weak var toDoItem: UITextField!
  @IBOutlet weak var isCompletedControl: UISegmentedControl!
  
  let stuff = CoreDataStuff()
  var makeToDoItem: String?
  var controlValue: Int = 0
  var deleteElement: ToDo?
  
  @IBAction func isCompleted(_ sender: Any) {
    controlValue = 1
  }
  
  @IBAction func submit(_ sender: Any) {
    delegate?.updateString(with: toDoItem.text ?? "")
    
    makeToDoItem = toDoItem.text
    try? stuff.toDo(whatToDo: makeToDoItem ?? "")
    stuff.save()
    
    if controlValue == 1 {
      stuff.finishedToDo(toDo: deleteElement!)
    }
    
    navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
      toDoItem.text = editString
    
//    darkModeSwitch.isOn = isDarkModeEnabled
    
      isCompletedControl.selectedSegmentIndex = controlValue
    
    
    
    }
    


}
