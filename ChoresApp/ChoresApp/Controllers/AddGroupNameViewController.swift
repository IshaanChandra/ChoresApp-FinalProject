//
//  AddGroupNameViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/25/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit



class AddGroupNameViewController: UIViewController {
    
    var groupName: String?
    
    @IBOutlet weak var groupNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let groupName = groupName {
            groupNameTextField.text = groupName
            
        } else {
            groupNameTextField.text = ""
        }
    }
}
