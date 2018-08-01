//
//  MainPageViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/24/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit

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
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
//
//        let note = notes[indexPath.row]
//        cell.noteTitleLabel.text = note.title
//        // 1
//        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknown"
//
//        return cell
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayGroup":
            print("group cell tapped")
            
        case "addGroup":
            print("create group bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
