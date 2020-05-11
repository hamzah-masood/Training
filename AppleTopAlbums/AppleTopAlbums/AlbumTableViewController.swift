//
//  AlbumTableViewController.swift
//  AppleTopAlbums
//
//  Created by mcs on 4/28/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import UIKit

class AlbumTableViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    private let viewModel = ViewModel()


    
    let tableView = UITableView()
    //let cell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupTableView()

    }
    
    func setupTableView(){
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        self.viewModel.getData {
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
        }
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return self.viewModel.numberOfAlbums()
        }
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
//            let cell = AlbumTableViewCell()
//            cell.albumName.text = albumArray[indexPath.row].name
//            cell.artistName.text = albumArray[indexPath.row].artistName
//            if let imageUrl = URL(string: albumArray[indexPath.row].artworkUrl100) {
//                if let data = try? Data(contentsOf: imageUrl) {
//                    cell.albumImage.image = UIImage(data: data)
//                }
//            }
            
            let cell = AlbumTableViewCell() //tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.albumLabel.text = self.viewModel.albumName(for: indexPath.row)
            cell.artistLabel.text = self.viewModel.artistName(for: indexPath.row)
            
            DispatchQueue.main.async {
                let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string:self.viewModel.albumImageURL(for: indexPath.row) ?? "")! as URL) as Data)
              cell.albumImageView.image = cellImage
            }

            cell.setupViews()
    
            return cell
        }
    


}



