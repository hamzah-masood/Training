//
//  Dog+CoreDataProperties.swift
//  
//
//  Created by mcs on 12/13/19.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var isGoodDog: Bool
    @NSManaged public var name: String?

}
