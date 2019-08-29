//
//  HamburgerMenuViewController.swift
//  HamburgerMenuProject
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

final class HamburgerMenuViewController: UIViewController {
  
  @IBOutlet weak var menuTableView: UITableView!
  
  @IBAction func didTapBackgroundView(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  let menuOptions = ["Account", "Settings", "Help"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    menuTableView.dataSource = self
    menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    
  }
  
}

extension HamburgerMenuViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = menuOptions[indexPath.row]
    return cell
  }
  
}
