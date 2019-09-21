//
//  Image+CoreDataProperties.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var url: String?
    @NSManaged public var user: String
    @NSManaged public var views: NSNumber
    @NSManaged public var likes: NSNumber
    @NSManaged public var comments: NSNumber
    @NSManaged public var isFavorited: Bool

}
