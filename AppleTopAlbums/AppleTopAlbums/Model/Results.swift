//
//  ResultsContainer.swift
//  AppleTopAlbums
//
//  Created by mcs on 5/15/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import Foundation

struct Results: Codable {
    let artistName: String?
    let releaseDate: String?
    let name: String?
    let copyright: String?
    let artworkUrl100: URL?
    let genres: [Genres]?
    let url: String?
}
