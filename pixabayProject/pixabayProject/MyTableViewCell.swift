//
//  MyTableViewCell.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  
  
  //let viewModel = imagesViewModel()

  var imageArray: [Image] = [] {
    didSet {
      myCollectionView.reloadData()
    }
  }
  

  
  @IBOutlet weak var myImage: UIImageView!
  
  @IBOutlet weak var myCollectionView: UICollectionView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    

//      self.imageArray = self.viewModel.imagesArray
//      self.viewModel.getData {
//        DispatchQueue.main.async {}
//
      self.myCollectionView.dataSource = self
      self.myCollectionView.delegate = self
      self.myCollectionView.register(UINib.init(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell") 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return imageArray.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
    
    
//    let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string: imageArray[indexPath.row].url ?? "")! as URL) as Data)
    URLSession.shared.dataTask(with: URL(string: imageArray[indexPath.row].url!)!, completionHandler: { (data, response, error) in
      if let data = data, let image = UIImage(data: data) {
        DispatchQueue.main.async {
          cell.myImageView.image = image
        }
      }
    }).resume()
    
//    cell.myImage.image = cellImage
    
    return cell
  }
}



