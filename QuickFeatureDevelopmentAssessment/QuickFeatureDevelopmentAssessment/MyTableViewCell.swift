//
//  MyTableViewCell.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MCS on 8/29/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

  @IBOutlet weak var detailLabel: UILabel!
  
  @IBOutlet weak var subtitleLabel: UILabel!
  
  @IBOutlet weak var cellImage: UIImageView!
  var selectedCell: Episode?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
