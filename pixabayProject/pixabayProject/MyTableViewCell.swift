//
//  MyTableViewCell.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  

  var imageArray: [Image] = []

  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
    return 15
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
    

    let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string:"https://pixabay.com/get/55e1d5474e53af14f6da8c7dda79367d1139d8e555536c4870297cd2934ac45eb0_640.jpg")! as URL) as Data)
    cell.myImage.image = cellImage

    return cell
  }
  

  @IBOutlet weak var myImage: UIImageView!
  
  @IBOutlet weak var myCollectionView: UICollectionView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
      self.myCollectionView.dataSource = self
      self.myCollectionView.delegate = self
      self.myCollectionView.register(UINib.init(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell") 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}




//    let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string: "https://pixabay.com/get/55e1d5474e53af14f6da8c7dda79367d1139d8e555536c4870297cd69f48cc5bbb_640.jpg")! as URL) as Data)
//    myImage.image = cellImage

