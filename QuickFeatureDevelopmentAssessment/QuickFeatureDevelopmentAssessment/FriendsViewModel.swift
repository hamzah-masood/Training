//
//  FriendsViewModel.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
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


final class FriendsViewModel {
  private let friendsURL = "https://api.tvmaze.com/shows/431?embed=episodes"
  private var episodes = [Episode]()
  
  func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
    guard let friendsUrl = URL(string: self.friendsURL) else {
      completion?()
      return
    }
    session.getData(from: friendsUrl) { [weak self] (data, error) in
      defer { completion?() }
      guard let data = data,
        error == nil,
        let episodeContainer = try? JSONDecoder().decode(EpisodeContainer.self, from: data) else { return }
      self?.episodes = episodeContainer.episodes
      }
  }
  func getTDDData(completion: () -> Void) {
    let newEpisode = Episode.init()
    episodes.append(newEpisode)
    completion()
  }
  
  
  func numberOfEpisodes() -> Int {
    return self.episodes.count
  }
  
  func episode(for index: Int) -> Episode {
    return self.episodes[index]
  }
}
