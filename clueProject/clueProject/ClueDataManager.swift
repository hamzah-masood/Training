//
//  ClueDataManager.swift
//  clueProject
//
//  Created by MCS on 8/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class ClueDataManager {
  static let shared = ClueDataManager()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "ClueDataModel")
    container.loadPersistentStores {( _, _ ) in }
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
   init () {}
  
  func save() {
    guard context.hasChanges else {return}
    try? context.save()
  }
  func addFavoritedClue(clue: Clue) throws -> Clue {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Clue", in: context) else { throw ClueDataError.noSuchEntity}
    let favoritedClue = Clue(entity: entityDescription, insertInto: context)
    return  favoritedClue
  }
  
  func getAllClues() -> [Clue] {
    let fetchRequest = NSFetchRequest<Clue>(entityName: "Clue")
    let favoritedCluesArray = try? context.fetch(fetchRequest)
    return favoritedCluesArray ?? []
  }
  func unfavorite(clue: Clue) {
    context.delete(clue)
    save()
  }

}

enum ClueDataError: Error {
  case noSuchEntity
}
