//
//  ViewController.swift
//  abercrombieProject
//
//  Created by mcs on 9/24/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyViewDelegate {

    

    
    
    func didTapButton(with value: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        nextViewController.url = value
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    

    @IBOutlet weak var mainTable: UITableView!
    
    let viewModel = categoryViewModel()
    
    let categoryArray: [Category] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        
        mainTable.dataSource = self
        mainTable.delegate = self
        //self.episodeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainTable.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        self.viewModel.getData {
            DispatchQueue.main.async {
                self.mainTable.reloadData()
            }
        }

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCategoriess()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.delegate = self
        let category = self.viewModel.category(for: indexPath.row)
        
        DispatchQueue.main.async {
            let cellImage = try? UIImage(data: NSData(contentsOf: NSURL(string:category.backgroundImage ?? "")! as URL) as Data)
            cell.backgroundImage.image = cellImage ?? nil
        }
        
        cell.topDescription.text? = category.topDescription ?? ""
        if cell.topDescription.text == "" {
            cell.topDescription.isHidden = true
        }
        cell.title.text? = category.title ?? ""
        if cell.title.text == "" {
            cell.title.isHidden = true
        }
        cell.promoMessage.text? = category.promoMessage ?? ""
        if cell.promoMessage.text == "" {
            cell.promoMessage.isHidden = true
        }
        
        let description = category.bottomDescription ?? ""
        let  updatedDescription = description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
       
        cell.bottomDescription.text? = updatedDescription
        if cell.bottomDescription.text == "" {
            cell.bottomDescription.isHidden = true
        }
        guard let contentArray = category.content  else {return cell}
        
        guard let myCount =  category.content?.count else { return cell }
        
        if contentArray.isEmpty {
            cell.contentButtonLabel.isHidden = true
            cell.content2Label.isHidden = true
        }
        
        else if category.content?.count == 1 {//myCount == 1 {
            let label = category.content?[0].title ?? ""
            cell.contentButtonLabel.setTitle(label, for: .normal)
            cell.urlString = category.content?[0].target ?? ""
            
            cell.content2Label.isHidden = true
        
        }
        else if myCount > 1 {
            let label = category.content?[0].title ?? ""
            let label2 = category.content?[1].title ?? ""
            
            cell.contentButtonLabel.setTitle(label, for: .normal)
            cell.urlString = category.content?[0].target ?? ""
            
            cell.content2Label.setTitle(label2, for: .normal)
            cell.secondURLString = category.content?[1].target ?? ""
            
 
           
        }
        
            
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    

    
}
