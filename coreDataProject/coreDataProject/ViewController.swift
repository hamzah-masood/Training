//
//  ViewController.swift
//  coreDataProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  let stuff = CoreDataStuff()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let container = stuff.persistentContainer
    print(container)
    do {
    let newDog = try? stuff.makeDog(name: "Scooby")
    print(newDog)
    stuff.save()
    } catch {
      print("{There was an error: \(error.localizedDescription)}")
    }
    
    let allDogs = stuff.getAllDogs()
    for dog in allDogs {
      print(dog.name)
    }
    print(allDogs)
    
    stuff.killDog(dog: allDogs[1])
    
    let newallDogs = stuff.getAllDogs()
    print(newallDogs)
    
    
  }
}

