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
  func updateArray(with value: [ToDo])
}


class toDoDetailViewController: UIViewController {
  
  var editString: String?
  var delegate: toDoDetailViewControllerDelegate?
  var toDoList: [ToDo] = []


  @IBOutlet weak var toDoItem: UITextField!
  @IBOutlet weak var isCompletedControl: UISegmentedControl!
  
  let stuff = CoreDataStuff()
  var makeToDoItem: String?
  var controlValue: Int = 0
  var deleteElement: ToDo?
  var arrayIndex: Int?
  
  @IBAction func isCompleted(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
        case 0:
          controlValue = 0
        case 1:
          controlValue = 1
        default:
          break
    }
  }
  
  
  @IBAction func submit(_ sender: Any) {
    delegate?.updateString(with: toDoItem.text ?? "")
    makeToDoItem = toDoItem.text
    toDoList = stuff.getAllToDo()
    stuff.finishedToDo(toDo: toDoList[arrayIndex!])
    
    try? stuff.toDo(whatToDo: makeToDoItem ?? "")
    stuff.save()
    let updatedArray = stuff.getAllToDo()
    delegate?.updateArray(with: updatedArray)
    
    if controlValue == 1 {
      toDoList = stuff.getAllToDo()
      stuff.finishedToDo(toDo: toDoList[arrayIndex!])
      let newToDoList = stuff.getAllToDo()
      delegate?.updateArray(with: newToDoList)
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
