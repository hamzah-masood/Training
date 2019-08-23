//
//  MyTableViewCell.swift
//  clueProject
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData

protocol MyCellDelegate {
  func getFavoritedClue(with value: Clue)
  func updateArray(with value: [Clue])
}


class MyTableViewCell: UITableViewCell {
  
  let stuff = ClueDataManager()
  
  var delegate: MyCellDelegate?


  var isFavorited: Bool = false
  
  var array: [Clue] = []
  var cellIndexPath: Int?
  var selectedCell: Clue?
  
  @IBOutlet weak var favorite: UIButton!
  
  
  
  @IBAction func isFavorite(_ sender: UIButton) {

    isFavorited = !isFavorited
    
    if isFavorited == true {
      print("item is favorited")
      self.backgroundColor = .red
      //delegate?.getFavoritedClue(with: favoritedClue)
      selectedCell?.isFavorited = true
      let favoritedClue = selectedCell
      try? stuff.addFavoritedClue(clue: favoritedClue!)
      stuff.save()
    }
    else if isFavorited == false {
      self.backgroundColor = .white
      selectedCell?.isFavorited = false
      try? stuff.unfavorite(clue: selectedCell!)
      stuff.save()
    }
    
    
    self.array = stuff.getAllClues()
    delegate?.updateArray(with: array)
    
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
