//
//  AddGroupNameViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/25/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddGroupNameViewController: UIViewController {
    
    var groupName: Group?
    
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var saveGroupName: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveGroupName.layer.cornerRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let groupName = groupName {
            groupNameTextField.text = groupName.groupsName
        } else {
            groupNameTextField.text = ""
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "savedGroupName" where groupName != nil:
            groupName?.groupsName = groupNameTextField.text ?? ""
            
            CoreDataHelper.saveGroup()
            
        case "savedGroupName" where groupName == nil:
            let groupName = CoreDataHelper.newGroup()
            groupName.groupsName = groupNameTextField.text ?? ""
            
            CoreDataHelper.saveGroup()
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    
}
