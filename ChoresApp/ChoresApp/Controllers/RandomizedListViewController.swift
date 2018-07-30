//
//  RandomizedListViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/27/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit

class RandomizedListViewController: UITableViewController {
    
    var chores = [Chore]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var people = [Chore]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = false
        chores = CoreDataHelper.retrieveChores()
        people = CoreDataHelper.retrievePerson()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomizedListTableViewCell", for: indexPath) as! RandomizedListTableViewCell
        
        let chore = chores[indexPath.row]
        let person = people[indexPath.row]
        cell.personNameLabel.text = person.person
        cell.choresGivenLabel.text = chore.choreItem
        return cell
    }
    
}

