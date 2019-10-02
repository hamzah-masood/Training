//
//  MyTableViewCell.swift
//  abercrombieProject
//
//  Created by mcs on 9/25/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import UIKit

protocol MyViewDelegate {
    func didTapButton(with value: String)
}

class MyTableViewCell: UITableViewCell {

    
    var delegate: MyViewDelegate?

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var topDescription: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var promoMessage: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    
    @IBOutlet weak var contentButtonLabel: UIButton!
    @IBOutlet weak var content2Label: UIButton!
    
    var urlString: String = ""
    var secondURLString: String = ""

    @IBAction func contentButton(_ sender: Any) {
        delegate?.didTapButton(with: urlString)
        
    }
    @IBAction func content2(_ sender: Any) {
        delegate?.didTapButton(with: secondURLString)
    }
    
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
        contentButtonLabel.isHidden = false
        contentButtonLabel.setTitle("", for: .normal)
        content2Label.isHidden = false
        content2Label.setTitle("", for: .normal)
        
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
