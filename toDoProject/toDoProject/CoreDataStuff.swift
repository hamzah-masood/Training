//
//  CoreDataStuff.swift
//  toDoProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStuff {
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "toDoList")
    container.loadPersistentStores(completionHandler: { (description, error) in
//      print(description)
//      print(error)
    })
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  func toDo(whatToDo: String) throws -> ToDo {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "ToDo", in: context) else { throw CoreDataError.noSuchEntity}
    let newToDo = ToDo(entity: entityDescription, insertInto: context)
    newToDo.whatToDo = whatToDo
    return newToDo
  }
  
  func getAllToDo() -> [ToDo] {
    let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
    let toDos = try? context.fetch(fetchRequest)
    return toDos ?? []
  }
  
  func save() {
    guard context.hasChanges else {return}
    try? context.save()
  }
  
  func finishedToDo(toDo: ToDo) {
    context.delete(toDo)
    save()
  }
  
}



enum CoreDataError: Error {
  case noSuchEntity
}

