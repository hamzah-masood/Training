//
//  ResultViewController.swift
//  BookSearch
//
//  Created by mcs on 12/18/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultTableView: UITableView!
    
    //var searchResults: SearchContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    // Do any additional setup after loading the view.
  }



}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        //cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
    
    
}

extension ResultViewController: UITableViewDelegate {
    
}

