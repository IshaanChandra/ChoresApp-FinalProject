//
//  Chore+CoreDataProperties.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/30/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//
//

import Foundation
import CoreData


extension Chore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chore> {
        return NSFetchRequest<Chore>(entityName: "Chore")
    }

    @NSManaged public var choreItem: String?
    @NSManaged public var owner: People?

}
