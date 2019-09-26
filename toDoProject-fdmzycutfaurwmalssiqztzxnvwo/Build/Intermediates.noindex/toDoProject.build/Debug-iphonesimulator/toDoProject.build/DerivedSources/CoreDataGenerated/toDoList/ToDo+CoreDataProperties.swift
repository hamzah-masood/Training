//
//  ToDo+CoreDataProperties.swift
//  
//
//  Created by mcs on 9/24/19.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var isFinished: Bool
    @NSManaged public var whatToDo: String?

}
