//
//  People+CoreDataProperties.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/30/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var person: String?
    @NSManaged public var chores: NSSet

}

// MARK: Generated accessors for chores
extension People {

    @objc(addChoresObject:)
    @NSManaged public func addToChores(_ value: Chore)

    @objc(removeChoresObject:)
    @NSManaged public func removeFromChores(_ value: Chore)

    @objc(addChores:)
    @NSManaged public func addToChores(_ values: NSSet)

    @objc(removeChores:)
    @NSManaged public func removeFromChores(_ values: NSSet)

}
