//
//  NextViewController.swift
//  DataBindingProject
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit



class NextViewController: UIViewController {
  
  var textString: String?
  @IBOutlet weak var customTextField: UITextField!
  
  @IBAction func submitButton(_ sender: Any) {
    
    navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //add observer
    //add observer to get changes made in the textfield
    customTextField.text = textString
  }
  
}
