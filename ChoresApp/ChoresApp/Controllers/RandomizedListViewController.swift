//
//  RandomizedListViewController.swift
//  
//
//  Created by Ishaan Chandra on 7/27/18.
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
    
}
