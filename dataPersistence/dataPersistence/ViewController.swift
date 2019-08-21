//
//  ViewController.swift
//  dataPersistence
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var darkModeLabel: UILabel!
  
  @IBOutlet weak var darkModeSwitch: UISwitch!
  
  @IBAction func didTapDarkMode(_ sender: Any) {
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
      darkModeLabel.textColor = .white
      view.backgroundColor = .black
    } else {
      darkModeLabel.textColor = .black
      view.backgroundColor = .white
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
    darkModeSwitch.isOn = isDarkModeEnabled
    updateUI()
    
  }

}

