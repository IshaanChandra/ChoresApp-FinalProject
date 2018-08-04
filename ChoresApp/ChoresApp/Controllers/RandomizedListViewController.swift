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
        
        let backColor = hexStringToUIColor(hex: "4DBCFF")
        
        self.navigationController?.navigationBar.tintColor = backColor
        
        chores = CoreDataHelper.retrieveChores()
        people = CoreDataHelper.retrievePerson()
        chores = shuffleArray(items: chores) as! [Chore]
        people = shuffleArray(items: people) as! [People]
        
        assignChoresToPeople()
        

    }
    
    func assignChoresToPeople() {
        var peopleIndex = 0
        
        if people.count == 0 {return}
        
        for chore in chores {
            chore.owner = people[peopleIndex]
            peopleIndex += 1
            if peopleIndex == people.count {
                peopleIndex = 0
            }
        }
        CoreDataHelper.saveChore()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomizedListTableViewCell", for: indexPath) as! RandomizedListTableViewCell
        
        
        var choreText: String = ""
        for item in people[indexPath.row].chores {
            let chore = item as! Chore
            choreText += chore.choreItem! + ", "
        }
        
        choreText = String(choreText.dropLast(2))
        
        cell.personNameLabel.text = people[indexPath.row].person! + ": " + choreText
        
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

