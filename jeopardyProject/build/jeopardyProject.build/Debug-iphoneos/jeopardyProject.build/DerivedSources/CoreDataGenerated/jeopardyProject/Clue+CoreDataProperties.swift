//
//  Clue+CoreDataProperties.swift
//  
//
//  Created by mcs on 4/20/20.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Clue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clue> {
        return NSFetchRequest<Clue>(entityName: "Clue")
    }

    @NSManaged public var airDate: String?
    @NSManaged public var answer: String?
    @NSManaged public var category: String?
    @NSManaged public var creationDate: String?
    @NSManaged public var isFavorited: NSObject?
    @NSManaged public var question: String?
    @NSManaged public var value: Int64

}
