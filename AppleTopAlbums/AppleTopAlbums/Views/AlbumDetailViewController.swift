//
//  AlbumDetailViewController.swift
//  AppleTopAlbums
//
//  Created by Hamzah Masood on 5/11/20.
//  Copyright © 2020 Hamzah Masood. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailViewController: UIViewController {

    var viewModel = ViewModel()
      
    var selectedAlbumIndex = 0
    
    let albumImage = UIImageView()
    let artistNameLabel = UILabel()
    let albumNameLabel = UILabel()
    let genreLabel = UILabel()
    let releaseLabel = UILabel()
    let copyrightLabel = UILabel()
    let iTunesButton = UIButton()
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAlbumImage()
        setupArtistName()
        setupAlbumName()
        setupGenre()
        setupRelease()
        setupCopyright()
        setupItunesButton()
        setupStackView()
        
        view.backgroundColor = .white
        view.addSubview(albumImage)
        stackView.addArrangedSubview(artistNameLabel)
        stackView.addArrangedSubview(albumNameLabel)
        stackView.addArrangedSubview(releaseLabel)
        stackView.addArrangedSubview(copyrightLabel)
        stackView.addArrangedSubview(genreLabel)
        view.addSubview(stackView)
        view.addSubview(iTunesButton)
        
        let viewsDict = [
            "albumImage": albumImage,
            "stackView": stackView,
            "iTunesButton": iTunesButton
        ]

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[albumImage(300)]-[stackView]", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[iTunesButton(30)]-20-|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[albumImage]-|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[stackView]-|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[iTunesButton]-20-|", options: [], metrics: nil, views: viewsDict))
        

    }
    
    
    func setupAlbumImage() {
        if let albumImageURL = viewModel.albumImageURL(for: selectedAlbumIndex) {
            
            URLSession.shared.dataTask(with: albumImageURL) { [weak self] data,_,_  in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.albumImage.image = UIImage(data: data)
                    }
                }.resume()
        }

        view.addSubview(albumImage)
        albumImage.contentMode = .scaleAspectFit
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumImage.clipsToBounds = true
        
    }
    
    func setupArtistName() {
        artistNameLabel.text = viewModel.artistName(for: selectedAlbumIndex)
        artistNameLabel.numberOfLines = 0
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupAlbumName() {
        albumNameLabel.text = viewModel.albumName(for: selectedAlbumIndex)
        albumNameLabel.numberOfLines = 0
        artistNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupGenre() {
        genreLabel.text = viewModel.genre(for: selectedAlbumIndex)?.reduce("Genres: ", {$0 + "\($1.name ?? "N/A") "})
        genreLabel.numberOfLines = 0
    }
    func setupRelease() {
        releaseLabel.text = viewModel.releaseDate(for: selectedAlbumIndex)
        releaseLabel.numberOfLines = 0
        releaseLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupCopyright() {
        copyrightLabel.text = viewModel.copywright(for: selectedAlbumIndex)
        copyrightLabel.numberOfLines = 0
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupItunesButton() {
        iTunesButton.backgroundColor = .black
        iTunesButton.setTitle("iTunes", for: .normal)
        iTunesButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func buttonAction(sender: UIButton!) {
        guard let albumURL = URL(string: viewModel.albumLink(for: selectedAlbumIndex) ?? "N/A"), UIApplication.shared.canOpenURL(albumURL) else { return }
        UIApplication.shared.open(albumURL, options: [:], completionHandler: nil)
    }
    
    func setupStackView() {
           stackView.axis = .vertical
           stackView.alignment = UIStackView.Alignment.leading
           stackView.spacing = 16
           stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}


