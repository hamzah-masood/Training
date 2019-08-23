//
//  Clue+CoreDataProperties.swift
//  clueProject
//
//  Created by MCS on 8/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Clue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clue> {
        return NSFetchRequest<Clue>(entityName: "Clue")
    }

    @NSManaged public var question: String?
    @NSManaged public var answer: String?
    @NSManaged public var category: String?
    @NSManaged public var value: NSNumber?
    @NSManaged public var airDate: String?
    @NSManaged public var creationDate: String?
    @NSManaged public var isFavorited: Bool

}
