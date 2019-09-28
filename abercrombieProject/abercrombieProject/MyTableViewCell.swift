//
//  MyTableViewCell.swift
//  abercrombieProject
//
//  Created by mcs on 9/25/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var topDescription: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var promoMessage: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var content2: UILabel!
    
    
//    topDesccription
//    a. Font Size: 13
//    3. title
//    a. Font Size: 17 (BOLD)
//    4. promoMessage
//    a. Font Size: 11
//    5. bottomDescription
//    a. Font Size: 13
//    6. content

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
       super.prepareForReuse()
        
        backgroundImage.isHidden = false
        topDescription.isHidden = false
        topDescription.text = ""
        title.isHidden = false
        title.text = ""
        promoMessage.isHidden = false
        promoMessage.text = ""
        bottomDescription.isHidden = false
        bottomDescription.text = ""
        content.isHidden = false
        content.text = ""
        content2.isHidden = false
        content2.text = ""
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
