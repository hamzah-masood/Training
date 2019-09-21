//
//  ViewController.swift
//  tableViews
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {

    @IBOutlet weak var theTableView: UITableView!
    
    var array = ["hi", "hello", "PCE", "Dip"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        theTableView.dataSource = self
        theTableView.delegate = self
        theTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    //delegation of updating string from nextViewController
    func updateString(with value: String){
        guard let selectedRow = theTableView.indexPathForSelectedRow?.row else {return}
        array[selectedRow] = value
        theTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //assigning main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //assigning next screen that is already on storyboard
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        //showing the next screen
        //present(nextViewController, animated: true, completion: nil)
        
        //jumpstart nextViewController
        //_ = nextViewController.view
        
        //^ do not jumpstart view 
        
        let tappedString = array[indexPath.row]
        nextViewController.editString = tappedString
        nextViewController.delegate = self
        
        //navigation controller pushes our (nextviewcontroller) on top if main storyboard,
        //automatically creating a back button
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
}
