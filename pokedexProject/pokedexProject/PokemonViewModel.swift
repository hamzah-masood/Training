//
//  PokemonViewModel.swift
//  pokedexProject
//
//  Created by mcs on 12/13/19.
//  Copyright © 2019 mcs. All rights reserved.
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

class PokemonViewModel {
    private let pokeAPI = "https://pokeapi.co/api/v2/pokemon/"//"https://api.tvmaze.com/shows/431?embed=episodes"
    private var newPokemonArray = [Pokemon]()
    
    func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
       guard let pokeAPI = URL(string: self.pokeAPI) else {
        completion?()
        return
      }
      session.getData(from: pokeAPI) { [weak self] (data, error) in
        defer { completion?() }
        guard let data = data,
          error == nil,
          let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { return }
        self?.newPokemonArray.append(pokemon)
        
        
        }
    }
    
}


/*

class categoryViewModel {
    private var categories = [Category]()
    let abercrombieURL = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"


    func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
        guard let abercrombieURL = URL(string: self.abercrombieURL) else {
         completion?()
         return
       }
       session.getData(from: abercrombieURL) { [weak self] (data, error) in
         defer { completion?() }
         guard let data = data,
           error == nil,
           let categoryArray = try? JSONDecoder().decode([Category].self, from: data) else { return }
        self?.categories = categoryArray
         }
     }
    
    func category(for index: Int) -> Category {
      return self.categories[index]
    }
    
    func numberOfCategoriess() -> Int {
        return categories.count
        //self.episodes.count
    }

}


/*
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
*/*/
