//
//  MainPageViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/24/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.isEditing = true
        
    }
    
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
