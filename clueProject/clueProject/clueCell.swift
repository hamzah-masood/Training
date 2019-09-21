//
//  ClueCell.swift
//  clueProject
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit


class ClueCell: UITableViewCell {
  
  var link: ViewController?
  
  let favStar = UIImage(named: "fav_star")
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    //backgroundColor = .red
    let starButton = UIButton(type: .system)
    starButton.setTitle("  *  ", for: .normal)
    starButton.setImage(favStar, for: .normal)
    starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    //starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
    
    accessoryView = starButton
    
  }
//
//  @objc func handleMarkAsFavorite() {
//    print("Marking As Favorite")
//    link?.getIndexPath(cell: self)
//  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
