//
//  MainPageViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/24/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import CoreData

class MainPageViewController: UITableViewController {
    
    var groups = [Group]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var chores = [Chore]()
    var people = [People]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = false
        groups = CoreDataHelper.retrieveGroup()
        chores = CoreDataHelper.retrieveChores()
        people = CoreDataHelper.retrievePerson()
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        

        
    }
    
    func deleteAllChores() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Chore")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }
    
    func deleteAllPeople() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainPageTableViewCell", for: indexPath) as! MainPageTableViewCell

        let group = groups[indexPath.row]
        cell.groupNameLabel.text = group.groupsName
        
        cell.viewCell.layer.cornerRadius = 6.0
        cell.viewCell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.viewCell.layer.shadowOffset = .zero
        cell.viewCell.layer.shadowOpacity = 0.6
        cell.viewCell.layer.shadowRadius = 5.0
        cell.viewCell.layer.shadowPath = UIBezierPath(rect: cell.viewCell.bounds).cgPath

        return cell
    }
    
    //deletes note
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let groupToDelete = groups[indexPath.row]
            CoreDataHelper.delete(group: groupToDelete)
            groups = CoreDataHelper.retrieveGroup()
            
        deleteAllPeople()
        deleteAllChores()
            
//            let choreToDelete = chores[indexPath.row]
//            CoreDataHelper.delete(chore: choreToDelete)
//            chores = CoreDataHelper.retrieveChores()
//
//            let personToDelete = people[indexPath.row]
//            CoreDataHelper.delete(person: personToDelete)
//            people = CoreDataHelper.retrievePerson()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        let movedObject = self.groups[sourceIndexPath.row]
        groups.remove(at: sourceIndexPath.row)
        groups.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(groups)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayGroup":
            // 1
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // 2
            //let group = groups[indexPath.row]
            // 3
    
            // 4
        case "addGroup":
            print("create group bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
