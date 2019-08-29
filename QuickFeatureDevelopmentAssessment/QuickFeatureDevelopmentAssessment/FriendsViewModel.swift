//
//  FriendsViewModel.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

final class FriendsViewModel {
  private let friendsURL = "https://api.tvmaze.com/shows/431?embed=episodes"
  private var episodes = [Episode]()
  
  func getData(_ completion: (() -> Void)?) {
    guard let friendsUrl = URL(string: self.friendsURL) else {
      completion?()
      return
    }
    URLSession.shared.dataTask(with: friendsUrl) { data, _, error in
      defer { completion?() }
      guard let data = data,
        error == nil,
        let episodeContainer = try? JSONDecoder().decode(EpisodeContainer.self, from: data) else { return }
      self.episodes = episodeContainer.episodes
    }.resume()
  }
  
  func numberOfEpisodes() -> Int {
    return self.episodes.count
  }
  
  func episode(for index: Int) -> Episode {
    return self.episodes[index]
  }
}
