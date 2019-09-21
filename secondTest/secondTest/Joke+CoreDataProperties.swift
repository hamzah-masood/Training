//
//  Joke+CoreDataProperties.swift
//  secondTest
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var category: String
    @NSManaged public var type: String
    @NSManaged public var joke: String?
    @NSManaged public var id: NSNumber?
    @NSManaged public var setup: String?
    @NSManaged public var delivery: String?

    @NSManaged public var isFavorited: Bool

}
