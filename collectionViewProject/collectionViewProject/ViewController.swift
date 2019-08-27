//
//  ViewController.swift
//  collectionViewProject
//
//  Created by MCS on 8/27/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionViewController: UICollectionView!
  
  var items = [1...1000]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    

    
    collectionViewController.dataSource = self
    collectionViewController.delegate = self
    collectionViewController.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
  }

}


extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
    cell.colorLabel.text = "Test"
  
    
    return cell
    
  
  }
}

extension ViewController: UICollectionViewDelegate {
  
}


