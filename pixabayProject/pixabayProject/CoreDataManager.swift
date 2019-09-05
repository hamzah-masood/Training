//
//  CoreDataManager.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "pixabayProject")
    container.loadPersistentStores {( _, _ ) in }
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  private init () {}
  
  func getAllImages() -> [Image] {
    let fetchRequest: NSFetchRequest<Image> = Image.fetchRequest()
    let allImages = try? context.fetch(fetchRequest)
    return allImages ?? []
  }
  
  func save() {
    guard context.hasChanges else {return}
    try? context.save()
  }
  
  
  
  
}
