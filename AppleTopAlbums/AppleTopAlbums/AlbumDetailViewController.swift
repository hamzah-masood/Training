//
//  AlbumDetailViewController.swift
//  AppleTopAlbums
//
//  Created by mcs on 5/11/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailViewController: UIViewController {

    private var viewModel = ViewModel()
    
    var selectedAlbumIndex = 0
    
    let albumImage = UIImageView()
    let artistNameLabel = UILabel()
    let albumNameLabel = UILabel()
    let genreLabel = UILabel()
    let releaseLabel = UILabel()
    let copyrightLabel = UILabel()
    let linkButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAlbumImage()
        setupArtistName()
        setupAlbumName()
        setupGenre()
        setupRelease()
        setupCopyright()
        setupLinkButton()
    }
    
    
    func setupAlbumImage() {
        
    }
    func setupArtistName() {
        
    }
    func setupAlbumName() {
        
    }
    func setupGenre() {
        
    }
    func setupRelease() {
        
    }
    func setupCopyright() {
        
    }
    func setupLinkButton() {
        
    }
    
}


