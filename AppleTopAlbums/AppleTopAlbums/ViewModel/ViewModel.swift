//
//  ViewModel.swift
//  AppleTopAlbums
//
//  Created by Hamzah Masood on 5/1/20.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

protocol Session {
  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?)
}
extension URLSession: Session {
  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
    dataTask(with: url) { (data, _, error) in
      completion?(data, error)
    }.resume()
  }
}


final class ViewModel {
    private let RSSURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
    var albums: [Results] = []
    
    func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
        guard let RSSUrl = URL(string: self.RSSURL) else {
        completion?()
        return
      }
      session.getData(from: RSSUrl) { [weak self] (data, error) in
        defer { completion?() }
        guard let data = data,
          error == nil,
          let albumContainer = try? JSONDecoder().decode(Albums.self, from: data) else { return }
        self?.albums = albumContainer.feed.results
        }
    }
    
    func numberOfAlbums() -> Int {
        return self.albums.count
    }

    func album(for index: Int) -> Results {
        return self.albums[index]
    }
    
    func albumName(for index: Int) -> String? {
        return self.albums[index].name
    }
    
    func artistName(for index: Int) -> String? {
        return self.albums[index].artistName
    }
    
    func albumImageURL(for index: Int) -> URL? {
        return self.albums[index].artworkUrl100
    }

    func genre(for index: Int) -> [Genres]? {
        return self.albums[index].genres
    }
    
    func releaseDate(for index: Int) -> String? {
        return self.albums[index].releaseDate
    }
    
    func copywright(for index: Int) -> String? {
        return self.albums[index].copyright
    }
    
    func albumLink(for index: Int) -> String? {
        return self.albums[index].url
    }

}
