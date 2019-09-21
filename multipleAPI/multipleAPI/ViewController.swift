//
//  ViewController.swift
//  multipleAPI
//
//  Created by MCS on 8/17/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var firstTable: UITableView!
  
  var myArray: [APIs] = []
  var secondArray: [MyTouple] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    firstTable.dataSource = self
    firstTable.delegate = self
    firstTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2")!) { (data, response, _) in
      guard let data = data else { return }
      let firstSet = try? JSONDecoder().decode(APIs.self, from: data)
      guard let allAPI = firstSet else {
        print("Something went wrong")
        return
      }
      
      self.myArray = [allAPI]
      
      let mirror = Mirror(reflecting: allAPI)
      
      
      
      for child in mirror.children  {
        print("key: \(child.label), value: \(child.value)")
        guard let label = child.label else {return}
        let valueLabel = child.value
        let newTouple = MyTouple(title: label, url: valueLabel as! String )
        
        self.secondArray.append(newTouple)
      }
      
      print(self.secondArray)

      
      //self.myArray.append(allAPI)
      

      //print(self.myArray)
  
      
      DispatchQueue.main.async {
        self.firstTable.reloadData()
      }
      }.resume()
    
  }

}


extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return secondArray.count //count of episodes
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = "\(secondArray[indexPath.row].title)"
    return cell
  }
  
}

extension ViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //main storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //assigning next screen
    let secondViewController = storyboard.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
    
  
    secondViewController.updatedTouple = secondArray[indexPath.row]
    secondViewController.setUpSecondViewController(secondTouple: secondArray[indexPath.row])

    
    if let index = self.firstTable.indexPathForSelectedRow {
      self.firstTable.deselectRow(at: index, animated: true)
    }
    
    
    navigationController?.pushViewController(secondViewController, animated: true)
  }
}


struct APIs: Codable {
  
  let ability: String
  let berry: String
  let berryFirmness: String
  let berryFlavor: String
  let characteristic: String
  let contestEffect: String
  let contestType: String
  let eggGroup: String
  let encounterCondition: String
  let encounterConditionValue: String
  let encounterMethod: String
  let evolutionChain: String
  let evolutionTrigger: String
  let gender: String
  let generation: String
  let growthRate: String
  let item: String
  let itemAttribute: String
  let itemCategory: String
  let itemFlingEffect: String
  let itemPocket: String
  let langauge: String
  let location: String
  let locationArea: String
  let machine: String
  let move: String
  let moveAilment: String
  let moveBattleStyle: String
  let moveCategory: String
  let moveDamageClass: String
  let moveLearnMethod: String
  let moveTarget: String
  let nature: String
  let palParkArea: String
  let pokeathlonStat: String
  let pokedex: String
  let pokemon: String
  let pokemonColor: String
  let pokemonForm: String
  let pokemonHabitat: String
  let pokemonShape: String
  let pokemonSpecies: String
  let region: String
  let stat: String
  let superContestEffect: String
  let type: String
  let version: String
  var versionGroup: String
  
  
  enum CodingKeys: String, CodingKey {
    case ability = "ability"// "https://pokeapi.co/api/v2/ability/"
    case berry = "berry"//: "https://pokeapi.co/api/v2/berry/",
    case berryFirmness = "berry-firmness"//: "https://pokeapi.co/api/v2/berry-firmness/",
    case berryFlavor = "berry-flavor"//: "https://pokeapi.co/api/v2/berry-flavor/",
    case characteristic = "characteristic"//: "https://pokeapi.co/api/v2/characteristic/",
    case contestEffect = "contest-effect"//: "https://pokeapi.co/api/v2/contest-effect/",
    case contestType = "contest-type"//: "https://pokeapi.co/api/v2/contest-type/",
    case eggGroup = "egg-group"//: "https://pokeapi.co/api/v2/egg-group/",
    case encounterCondition = "encounter-condition"//: "https://pokeapi.co/api/v2/encounter-condition/",
    case encounterConditionValue = "encounter-condition-value"//: "https://pokeapi.co/api/v2/encounter-condition-value/",
    case encounterMethod = "encounter-method"//: "https://pokeapi.co/api/v2/encounter-method/",
    case evolutionChain = "evolution-chain"//: "https://pokeapi.co/api/v2/evolution-chain/",
    case evolutionTrigger = "evolution-trigger"//: "https://pokeapi.co/api/v2/evolution-trigger/",
    case gender = "gender"//: "https://pokeapi.co/api/v2/gender/",
    case generation = "generation"//: "https://pokeapi.co/api/v2/generation/",
    case growthRate = "growth-rate"//: "https://pokeapi.co/api/v2/growth-rate/",
    case item = "item"//: "https://pokeapi.co/api/v2/item/",
    case itemAttribute = "item-attribute"//: "https://pokeapi.co/api/v2/item-attribute/",
    case itemCategory = "item-category"//: "https://pokeapi.co/api/v2/item-category/",
    case itemFlingEffect = "item-fling-effect"//: "https://pokeapi.co/api/v2/item-fling-effect/",
    case itemPocket = "item-pocket"//: "https://pokeapi.co/api/v2/item-pocket/",
    case langauge = "language"//: "https://pokeapi.co/api/v2/language/",
    case location = "location"//: "https://pokeapi.co/api/v2/location/",
    case locationArea = "location-area"//: "https://pokeapi.co/api/v2/location-area/",
    case machine = "machine"//: "https://pokeapi.co/api/v2/machine/",
    case move = "move"//: "https://pokeapi.co/api/v2/move/",
    case moveAilment = "move-ailment"//: "https://pokeapi.co/api/v2/move-ailment/",
    case moveBattleStyle = "move-battle-style"//: "https://pokeapi.co/api/v2/move-battle-style/",
    case moveCategory = "move-category"// "https://pokeapi.co/api/v2/move-category/",
    case moveDamageClass = "move-damage-class"// "https://pokeapi.co/api/v2/move-damage-class/",
    case moveLearnMethod = "move-learn-method"// "https://pokeapi.co/api/v2/move-learn-method/",
    case moveTarget = "move-target"//: "https://pokeapi.co/api/v2/move-target/",
    case nature = "nature"//: "https://pokeapi.co/api/v2/nature/",
    case palParkArea = "pal-park-area"//: "https://pokeapi.co/api/v2/pal-park-area/",
    case pokeathlonStat = "pokeathlon-stat"//: "https://pokeapi.co/api/v2/pokeathlon-stat/",
    case pokedex = "pokedex"//: "https://pokeapi.co/api/v2/pokedex/",
    case pokemon = "pokemon"//: "https://pokeapi.co/api/v2/pokemon/",
    case pokemonColor = "pokemon-color"//: "https://pokeapi.co/api/v2/pokemon-color/",
    case pokemonForm = "pokemon-form"//: "https://pokeapi.co/api/v2/pokemon-form/",
    case pokemonHabitat = "pokemon-habitat"//: "https://pokeapi.co/api/v2/pokemon-habitat/",
    case pokemonShape = "pokemon-shape"//: "https://pokeapi.co/api/v2/pokemon-shape/",
    case pokemonSpecies = "pokemon-species"//: "https://pokeapi.co/api/v2/pokemon-species/",
    case region = "region"//: "https://pokeapi.co/api/v2/region/",
    case stat = "stat"//: "https://pokeapi.co/api/v2/stat/",
    case superContestEffect = "super-contest-effect"//: "https://pokeapi.co/api/v2/super-contest-effect/",
    case type = "type"//:// "https://pokeapi.co/api/v2/type/",
    case version = "version"//: "https://pokeapi.co/api/v2/version/",
    case versionGroup = "version-group"//: "https://pokeapi.co/api/v2/version-group/"
  }
}


struct MyTouple {
  let title: String
  let url: String
}
