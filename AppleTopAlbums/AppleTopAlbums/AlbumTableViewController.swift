//
//  AlbumTableViewController.swift
//  AppleTopAlbums
//
//  Created by mcs on 4/28/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import UIKit

class AlbumTableViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {

    
    let tableView = UITableView()
    let cell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setupTableView(){
        
        //Registers a class for use in creating new table cells.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.dataSource = self
        tableView.delegate = self
        
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 100
        }
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Album # \(indexPath)"
    
    
            return cell
        }


}

//extension AlbumTableViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 100
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Album # \(indexPath)"
//
//
//        return cell
//    }
//
//}


