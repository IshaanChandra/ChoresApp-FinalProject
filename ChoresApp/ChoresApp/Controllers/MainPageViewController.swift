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

class MainPageViewController: UITableViewController {
    
    var groups = [Group]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = false
        groups = CoreDataHelper.retrieveGroup()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        
    }
    
    @objc func handleSignOutButtonTapped() {
        do {
            try Auth.auth().signOut()
            let loginViewController = LoginViewController()
            let loginNavigationController = UINavigationController(rootViewController: loginViewController)
            self.present(loginNavigationController, animated: true, completion: nil)
        } catch let err {
            print("Failed to sign out with error", err)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainPageTableViewCell", for: indexPath) as! MainPageTableViewCell

        let group = groups[indexPath.row]
        cell.groupNameLabel.text = group.groupsName

        return cell
    }
    
    //deletes note
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let groupToDelete = groups[indexPath.row]
            CoreDataHelper.delete(group: groupToDelete)
            
            groups = CoreDataHelper.retrieveGroup()
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
