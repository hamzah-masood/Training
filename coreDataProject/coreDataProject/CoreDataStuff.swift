//
//  CoreDataStuff.swift
//  coreDataProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStuff {
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "ExampleModel")
    container.loadPersistentStores(completionHandler: { (description, error) in
      print(description)
      print(error)
    })
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  func makeDog(name: String) throws -> Dog {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Dog", in: context) else { throw CoreDataError.noSuchEntity}
    let newDog = Dog(entity: entityDescription, insertInto: context)
    newDog.name = name
    return newDog
  }
  func getAllDogs() -> [Dog] {
    let fetchRequest = NSFetchRequest<Dog>(entityName: "Dog")
    let dogs = try? context.fetch(fetchRequest)
    return dogs ?? []
  }
  func save() {
    guard context.hasChanges else {return}
    try? context.save()
  }
  func killDog(dog: Dog) {
    context.delete(dog)
    save()
  }
  
}


enum CoreDataError: Error {
  case noSuchEntity
}
