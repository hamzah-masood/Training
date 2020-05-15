//
//  AlbumTableViewController.swift
//  AppleTopAlbums
//
//  Created by Hamzah Masood on 4/28/20.
//  Copyright © 2020 Hamzah Masood. All rights reserved.
//

import UIKit

class AlbumTableViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    private let viewModel = ViewModel()

    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func setupTableView(){
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        viewModel.getData { [weak self] in //we want the data to get deallocated when we need to
            DispatchQueue.main.async {
                self?.tableView.reloadData()
          }
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfAlbums()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumTableViewCell
        
        cell.albumLabel.text = viewModel.albumName(for: indexPath.row)
        cell.artistLabel.text = viewModel.artistName(for: indexPath.row)
        
        if let albumImageURL = viewModel.albumImageURL(for: indexPath.row) {
            
            URLSession.shared.dataTask(with: albumImageURL) { data,_,_  in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    cell.albumImageView.image = UIImage(data: data)

                    }
                }.resume()

        }

        cell.setupViews()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumDetailViewController = AlbumDetailViewController()
        albumDetailViewController.selectedAlbumIndex = indexPath.row
        albumDetailViewController.viewModel = viewModel
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(albumDetailViewController, animated: true)

    }
    
}



