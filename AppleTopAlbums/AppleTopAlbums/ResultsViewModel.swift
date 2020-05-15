//
//  ResultsViewModel.swift
//  AppleTopAlbums
//
//  Created by mcs on 5/7/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import Foundation



final class ResultViewModel {
    private let album: Results
    
    init(album: Results) {
        self.album = album
    }
    func albumName() -> String? {
        return album.name
    }
        
//        func artistName(for index: Int) -> String? {
//            return self.albums[index].artistName
//        }
//        
//        func albumImageURL() -> URL? {
//            return album.artworkUrl100
//        }
//
//    //    func genre() {
//    //
//    //    }
//        
//        func releaseDate(for index: Int) -> String? {
//            return self.albums[index].releaseDate
//        }
//        
//        func copywright(for index: Int) -> String? {
//            return self.albums[index].copyright
//        }
//        
//        func albumLink(for index: Int) -> String? {
//            return self.albums[index].url
//        }

    
}


