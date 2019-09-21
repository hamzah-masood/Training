//
//  ViewController.swift
//  apiCrawler
//
//  Created by MCS on 8/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var crawlerTableView: UITableView!
  
  @IBAction func rootView(_ sender: Any) {
  navigationController?.popToRootViewController(animated: true)
  }
  
  
  var url: String? = "https://pokeapi.co/api/v2"
  var jsonDictionary: [String: Any] = [:] {
    didSet {
      dictionaryPresent = true
    }
  }
  var array: [[String:Any]] = [] {
    didSet {
      dictionaryPresent = false
    }
  }
  
  var dictionaryPresent = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    crawlerTableView.dataSource = self
    crawlerTableView.delegate = self
    crawlerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "crawlerCell")
    
    guard let unwrappedURL = url,
      let url = URL(string: unwrappedURL) else {return}
    URLSession.shared.dataTask(with: url) { (data, _, _) in
      guard let data = data,
        let jsonObject =  try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return}
      
      self.jsonDictionary = jsonObject
      
      DispatchQueue.main.async {
        self.crawlerTableView.reloadData()
      }
      
      }.resume()
    
  }
//  func verifyUrl (urlString: String?) -> Bool {
//    //Check for nil
//    if let urlString = urlString {
//      // create NSURL instance
//      if let actualURL = NSURL(string: urlString) {
//        // check if your application can open the NSURL instance
//        print(actualURL)
//        return true
//      }
//    }
//    return false
//  }

  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dictionaryPresent
      ? jsonDictionary.count
      : array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "crawlerCell")
    if !dictionaryPresent {
      cell.textLabel?.text = "Index\([indexPath.row])"
      //cell.detailTextLabel?.text = "Dictionary has \()"
      
    }
    else {
      
      let orderedKeys = jsonDictionary.keys.sorted()
      let currentKey = orderedKeys[indexPath.row]
      let currentValue = jsonDictionary[currentKey]

      cell.textLabel?.text = currentKey
      if let currentValueArray = currentValue as? [[String: Any]]{
        cell.detailTextLabel?.text = "Array has \(currentValueArray.count ?? 0) Obejcts"
      }
      else {
        cell.detailTextLabel?.text = "\(currentValue ?? "No Value")"
      }
    }
    
    return cell
    
  }
}

extension ViewController: UITableViewDelegate {
  
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //fill in later
    if !dictionaryPresent {
      let tappedElement = array[indexPath.row]
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
      
      nextViewController.jsonDictionary = tappedElement
      nextViewController.url = nil
      navigationController?.pushViewController(nextViewController, animated: true)
      
    }
    else {
      let tappedKey = jsonDictionary.keys.sorted()[indexPath.row]
    
      
      if let tappedURL = jsonDictionary[tappedKey] as? String {
        
        if tappedURL.contains("pokeapi.co") //verifyUrl(urlString: tappedURL) == true
        {
        
          let storyboard = UIStoryboard(name: "Main" , bundle: nil)
          let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
          nextViewController.url = tappedURL
          
          navigationController?.pushViewController(nextViewController, animated: true)
        }
      }
      else if let tappedArray = jsonDictionary[tappedKey] as? [[String: Any]] {
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        nextViewController.array = tappedArray
        nextViewController.url = nil
        
        navigationController?.pushViewController(nextViewController, animated: true)
      }
      
      
//      else if let tappedString = jsonDictionary[tappedKey] as? String{
//        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
//        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//
//        nextViewController.array = [tappedString]
//        nextViewController.url = nil
//
//      }
      
    }
    self.crawlerTableView.deselectRow(at: indexPath, animated: true)
  }
  
}
