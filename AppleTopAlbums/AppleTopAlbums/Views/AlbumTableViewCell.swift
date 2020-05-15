//
//  AlbumTableViewCell.swift
//  AppleTopAlbums
//
//  Created by Hamzah Masood on 5/10/20.
//  Copyright © 2020 Hamzah Masood. All rights reserved.
//

import Foundation
import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    let albumImageView: UIImageView = {
        let albmImageView = UIImageView()
        
        albmImageView.contentMode = .scaleAspectFill
        albmImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return albmImageView
    }()
    
    let albumLabel: UILabel = {
        let albmLabel = UILabel()
        albmLabel.numberOfLines = 0
        albmLabel.font = UIFont.boldSystemFont(ofSize: 20)
        albmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return albmLabel
    }()
    
    let artistLabel: UILabel = {
       let artstLabel = UILabel()
        artstLabel.numberOfLines = 0
        artstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return artstLabel
    }()

    func setupViews() {
        
        addSubview(albumImageView)
        addSubview(artistLabel)
        addSubview(albumLabel)
        
        let viewsDict = [
            "image": albumImageView,
            "artist": artistLabel,
            "album": albumLabel,
        ]


        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(100@999)]-|", options: [], metrics: nil, views: viewsDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[image(100)]-|", options: [], metrics: nil, views: viewsDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[artist]-[image]", options: [], metrics: nil, views: viewsDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[album]-[image]", options: [], metrics: nil, views: viewsDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[artist]-[album]-|", options: [], metrics: nil, views: viewsDict))
    }
}


