//
//  ViewController.swift
//  DataBindingProject
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  func updateString(with value: String) {
    guard let selectedRow = mainTableView.indexPathForSelectedRow?.row else {return}
    infoArray[selectedRow] = value
    mainTableView.reloadData()
  }
  

  @IBOutlet weak var mainTableView: UITableView!
  @IBOutlet weak var dataBindingLabel: UILabel!
  
  var infoArray: [String] = ["First PRoperty", "Second Property", "3rd Property", "4th Property"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    mainTableView.dataSource = self
    mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    mainTableView.delegate = self
    
    
    
    
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return infoArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = infoArray[indexPath.row]
    return cell
  }
}


//Need to replace this method

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    
    var customTextString = infoArray[indexPath.row]
    nextViewController.textString = customTextString
    
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
}
