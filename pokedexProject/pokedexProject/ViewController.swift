//
//  ViewController.swift
//  pokedexProject
//
//  Created by mcs on 12/13/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTable: UITableView!
    
    var pokemonArray: [Pokemon] = []
    var newArray: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        mainTable.dataSource = self
        mainTable.delegate = self
        mainTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        for i in 1...807 {
            
            guard let pokeURL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(i)") else { return }
            URLSession.shared.dataTask(with: pokeURL) { (data, response, _) in
                guard let data = data else { return }
                let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
                guard let newPokemon = pokemon else {
                    print("Something went wrong")
                    return
                }
                
                self.pokemonArray.append(newPokemon)
                
                
                DispatchQueue.main.async {
                    self.mainTable.reloadData()
                }
                
                
            }.resume()
            
        }
        
        
        
        
        //newArray = pokemonArray.sorted(by: {$0.name < $1.name})
        
        
        print(newArray)
        //movieArr.sorted { $0.name < $1.name }
        
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        newArray = pokemonArray.sorted(by: {$0.name < $1.name})
        cell.textLabel?.text = newArray[indexPath.row].name
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(identifier: "NextViewController")
        self.mainTable.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
