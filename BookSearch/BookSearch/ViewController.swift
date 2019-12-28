//
//  ViewController.swift
//  BookSearch
//
//  Created by MAC on 12/13/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchInput: UITextField!
    
    var searchQuery: String = ""
    @IBOutlet weak var resultTable: UITableView!
    
    var totalCount: Int = 0
    var finalSearchResult: SearchContainer?
    var resultArray: [Results] = []
    
    @IBAction func searchButton(_ sender: Any) {
        
        searchQuery = searchInput.text ?? ""
        
        let finalQuery = searchQuery.replacingOccurrences(of: " ", with: "+")
        
        guard let searchURL = URL(string: "http://openlibrary.org/search.json?q=\(finalQuery)") else { return }
        URLSession.shared.dataTask(with: searchURL) { (data, response, _) in
            guard let data = data else { return }
            let searchResult = try? JSONDecoder().decode(SearchContainer.self, from: data)
            guard let newSearchResult = searchResult else {
                print("Something went wrong")
                return
            }
            self.finalSearchResult = newSearchResult
            self.resultArray = newSearchResult.results
            print(newSearchResult)
            
            
            DispatchQueue.main.async {
                self.resultTable.reloadData()
            }
        
            
        }.resume()
        
        
        //ResultViewController.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultViewController = storyboard.instantiateViewController(identifier: "ResultViewController")
        //self.navigationController?.pushViewController(resultViewController, animated: true)
        resultTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultTable.dataSource = self
        resultTable.delegate = self
        resultTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        totalCount = finalSearchResult?.numFound ?? 0
        
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")

        
        if resultArray.isEmpty == false {
            cell.textLabel?.text = resultArray[indexPath.row].title
            return cell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(resultArray.count) matches found for \(searchQuery)"
    }
    
    
    

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
    
        detailViewController.bookTitle = resultArray[indexPath.row].title
        detailViewController.authorName = resultArray[indexPath.row].authorName
        detailViewController.publishYear = resultArray[indexPath.row].publishYear
        detailViewController.publishDate = resultArray[indexPath.row].publishDate
        
        
        
        resultTable.deselectRow(at: indexPath, animated: true)
        //tableView(resultTable, didDeselectRowAt: indexPath)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
    
    
}
