//
//  RandomizedListViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/27/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RandomizedListViewController: UITableViewController {
    
    var chores = [Chore]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var people = [People]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = false
        chores = CoreDataHelper.retrieveChores()
        people = CoreDataHelper.retrievePerson()
        chores = shuffleArray(items: chores) as! [Chore]
        people = shuffleArray(items: people) as! [People]

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomizedListTableViewCell", for: indexPath) as! RandomizedListTableViewCell

        let chore = chores[indexPath.row]
        let person = people[indexPath.row]
        cell.personNameLabel.text = person.person! + ": " + chore.choreItem!
        //cell.choresGivenLabel.text = chore.choreItem
        return cell
    }
    
    func shuffleArray(items: [Any]) -> [Any] {
        var items = items
        var last = items.count - 1
        
        while(last > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            
            print("swap items[\(last)] = \(items[last]) with items[\(rand)] = \(items[rand])")
            
            items.swapAt(last, rand)
            
            print(items)
            
            last -= 1
        }
        
        return items
    }
}

