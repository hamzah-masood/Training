//
//  AlbumTableViewCell.swift
//  AppleTopAlbums
//
//  Created by mcs on 5/10/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import Foundation
import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    
    //Album Image in the tableviewcell
    let albumImageView: UIImageView = {
        let albmImageView = UIImageView()
        
        // image will never be stretched vertically or horizontally
        albmImageView.contentMode = .scaleAspectFill
        // enable autolayout
        albmImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return albmImageView
    }()
    
    //Album label for tableviewcell
    let albumLabel: UILabel = {
        let albmLabel = UILabel()
        albmLabel.font = UIFont.boldSystemFont(ofSize: 20)
        albmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return albmLabel
    }()
    
    //artist label for tableviewcell
    let artistLabel: UILabel = {
       let artstLabel = UILabel()
        artstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return artstLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //setupViews()
     }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupViews() {
//        addSubview(albumImageView)
//        addSubview(artistLabel)
//        addSubview(albumLabel)
//
//        setupConstraints()
//    }
    
    func setupViews() {
        
        self.addSubview(albumImageView)
        self.addSubview(artistLabel)
        self.addSubview(albumLabel)
        
        let viewsDict = [
            "image": albumImageView,
            "artist": artistLabel,
            "album": albumLabel,
        ]

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(20)]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[artist]-[album]-|", options: [], metrics: nil, views: viewsDict))
        //contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[artist]-|", options: [], metrics: nil, views: viewsDict))
    }
    


//     required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//    }
}


