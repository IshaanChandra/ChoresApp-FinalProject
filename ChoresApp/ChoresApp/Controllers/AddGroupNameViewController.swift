//
//  AddGroupNameViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/25/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase


class AddGroupNameViewController: UIViewController {
    
    var groupName: String?
    
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var saveGroupName: UIButton!
    
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

    @IBAction func saveButtonTapped(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Home", bundle: .main)
//        if let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") {
//            self.view.window?.rootViewController = initialViewController
//            self.view.window?.makeKeyAndVisible()
//        }
        
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        if let initialViewController = storyboard.instantiateInitialViewController() {
//            self.view.window?.rootViewController = initialViewController
//            self.view.window?.makeKeyAndVisible()
//        }
    }
    
}
