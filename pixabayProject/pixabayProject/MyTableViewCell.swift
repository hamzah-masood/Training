//
//  MyTableViewCell.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 180, height: 200)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "nextViewController") as! NextViewController
    
    nextViewController.updatedUser = imageArray[indexPath.row].user
    nextViewController.updatedViews = imageArray[indexPath.row].views as? Int
    nextViewController.updatedLikes = imageArray[indexPath.row].likes as? Int
    nextViewController.updatedComments = imageArray[indexPath.row].comments as? Int
  
    
    //UINavigationController.pushViewController(nextViewController, animated: true)
    
    
//      if let index = self.clueTable.indexPathForSelectedRow {
//        self.clueTable.deselectRow(at: index, animated: true)
//      }
      
    
      //navigationController?.pushViewController(NextViewController, animated: true)
  }
  
}


