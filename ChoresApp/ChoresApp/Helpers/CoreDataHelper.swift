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
        
        var choresArray  = [Chore]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Chore")
        
        
        do {
            let results = try context.fetch(fetchRequest)
            let chores = results as! [Chore]
            
            for _chores in chores {
                print(_chores.choreItem!)
                choresArray.append(_chores)
            }
            
            return choresArray
        }catch let err as NSError {
            print(err.debugDescription)
            return []
        }
        
        
        
//        do {
//            let fetchRequest = NSFetchRequest<Chore>(entityName: "Chore")
//            let results = try context.fetch(fetchRequest)
//
//            return results
//        } catch let error {
//            print("Could not fetch \(error.localizedDescription)")
//
//            return []
//        }
    }
    
    //People
    static func newPerson() -> People {
        let person = NSEntityDescription.insertNewObject(forEntityName: "People", into: context) as! People
        
        return person
    }
    
    static func savePerson() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(person: People) {
        context.delete(person)
        
        savePerson()
    }
    
    static func retrievePerson() -> [People] {
        var peopleArray  = [People]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        
        
        do {
            let results = try context.fetch(fetchRequest)
            let persons = results as! [People]
            
            for _persons in persons {
                print(_persons.person!)
                peopleArray.append(_persons)
            }
            
            return peopleArray
        }catch let err as NSError {
            print(err.debugDescription)
            return []
        }
       
        
        
//        do {
//            let fetchRequest = NSFetchRequest<People>(entityName: "People")
//            let results = try context.fetch(fetchRequest)
//
//            return results
//        } catch let error {
//            print("Could not fetch \(error.localizedDescription)")
//
//            return []
//        }
    }
}

