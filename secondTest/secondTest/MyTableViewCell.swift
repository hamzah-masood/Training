//
//  MyTableViewCell.swift
//  secondTest
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

  
  var favoritesArray: [Joke] = []
  var isFavorited: Bool = false
  var selectedCell: Joke?
  
  @IBOutlet weak var favorite: UIButton!
  
  
  @IBAction func isFavorite(_ sender: UIButton) {
    isFavorited = !isFavorited
    
    if isFavorited == true {
      print("item is favorited")
      self.backgroundColor = .red
      
      selectedCell?.isFavorited = true
      let favoritedJoke = selectedCell
      favoritesArray.append(favoritedJoke!)
      CoreDataManager.shared.save()
    }
    else if isFavorited == false {
      self.backgroundColor = .white
      selectedCell?.isFavorited = false
      let unfavoritedJoke = selectedCell
      if let index = favoritesArray.firstIndex(of: unfavoritedJoke!) {
        favoritesArray.remove(at: index)
      }

      CoreDataManager.shared.save()
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.backgroundColor = .white
    
  }

  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
