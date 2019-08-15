//
//  ViewController.swift
//  SingletonProject
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var pokemonNameLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let group = DispatchGroup()
    var pokemonArray: [Pokemon] = []
    
    for _ in 1...6 {
      group.enter()
      getRandomPokemon { (pokemon) in
        defer { group.leave() }
        guard let pokemon = pokemon else { return }
        pokemonArray.append(pokemon)
      }
    }
    
    // this is where we do work after all the calls are done
    group.notify(queue: .main){
      let pokemonNameString = pokemonArray.isEmpty
        ? "No Pokemon is found"
        : String(pokemonArray.reduce("", { $0 + $1.name + "/"}).dropLast(1))
      self.pokemonNameLabel.text = pokemonNameString
    }
    
    
//    getRandomPokemon { (pokemon) in
//      DispatchQueue.main.async {
//        self.pokemonNameLabel.text = pokemon.name
//      }
//    }
    
//    URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2/pokemon/34")!) { (data, _, _) in
//      guard let data = data else { return }
//      let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
//
////      //implement code after 2 seconds
////      DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
////        self.pokemonNameLabel.text = pokemon?.name
////        })
//
//      DispatchQueue.main.async {
//        self.pokemonNameLabel.text = pokemon?.name
//      }
//    }.resume()
  }
  
  func getRandomPokemon(completion: @escaping (Pokemon?) -> Void ) {
    let pokemonNumber = Int.random(in: 1...807)
    URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)")!) { (data, _, _) in
      guard let data = data,
      let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {
        completion(nil)
        return
      }
      completion(pokemon)
    }.resume()
  }
}

struct Pokemon: Codable {
  let name: String
}

//class MySingleton {
//
//  static let shared = MySingleton()
//
//
//  private init() {}
//}
