//
//  ViewController.swift
//  abercrombieProject
//
//  Created by mcs on 9/24/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        cell.bottomDescription.text? = category.bottomDescription ?? ""
        if cell.bottomDescription.text == "" {
            cell.bottomDescription.isHidden = true
        }
        
        cell.content.text? = category.content?[0].title ?? ""
        if cell.content.text == "" {
            cell.content.isHidden = true
        }
//        cell.content2.text? = category.content?[1].title ?? ""
//        if cell.content2.text == "" {
//            cell.content2.isHidden = true
//        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
