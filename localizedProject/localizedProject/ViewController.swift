//
//  ViewController.swift
//  localizedProject
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var languageLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    languageLabel.text = localizableStrings.helloPerson(person: "Hamzah")
    
    
    
  }


}

