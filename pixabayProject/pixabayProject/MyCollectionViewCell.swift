//
//  MyCollectionViewCell.swift
//  pixabayProject
//
//  Created by MCS on 9/3/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var myImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      self.backgroundColor = .red
    }

}
