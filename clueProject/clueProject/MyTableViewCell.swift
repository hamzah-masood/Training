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
  
  var cellAnswer: String?
  var cellQuestion: String?
  var cellValue: NSNumber?
  var cellAirDate: String?
  var cellTitle: String?
  var cellCreationAt: String?
  var wifiOn: Bool?
  var favoriteIndex = 0
  var favoriteIndexArray: [Int] = []
  var clue: Clue?
  
  //let stuff = ClueDataManager()
  
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
      let newClue = try? ClueDataManager.shared.addClue(answer: cellAnswer ?? "", question: cellQuestion ?? "", airDate: cellAirDate ?? "", creationDate: cellCreationAt ?? "", value: cellValue ?? 0, category: cellTitle ?? "")

      selectedCell?.isFavorited = true
      let favoritedClue = selectedCell
     // try? ClueDataManager.shared.addFavoritedClue(clue: favoritedClue!)
      
      ClueDataManager.shared.save()
    }
    else if isFavorited == false {
      self.backgroundColor = .white
      selectedCell?.isFavorited = false
      try? ClueDataManager.shared.unfavorite(clue: selectedCell!)
      ClueDataManager.shared.save()
    }
    
    
    self.array = ClueDataManager.shared.getAllClues()
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
