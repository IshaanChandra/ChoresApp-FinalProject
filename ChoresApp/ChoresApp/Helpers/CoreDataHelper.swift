//
//  CoreDataHelper.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/27/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    // Chores
    static func newChore() -> Chore {
        let chore = NSEntityDescription.insertNewObject(forEntityName: "Chore", into: context) as! Chore
        
        return chore
    }
    
    static func saveChore() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(chore: Chore) {
        context.delete(chore)
        
        saveChore()
    }
    
    static func retrieveChores() -> [Chore] {
        do {
            let fetchRequest = NSFetchRequest<Chore>(entityName: "Chore")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    //People
    static func newPerson() -> Chore {
        let person = NSEntityDescription.insertNewObject(forEntityName: "Chore", into: context) as! Chore
        
        return person
    }
    
    static func savePerson() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(person: Chore) {
        context.delete(person)
        
        savePerson()
    }
    
    static func retrievePerson() -> [Chore] {
        do {
            let fetchRequest = NSFetchRequest<Chore>(entityName: "Chore")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
}

