//
//  HomePageViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/26/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class HomePageViewController: UIViewController {
    
    var groups = [Group]()
    
    @IBOutlet weak var addChoresButton: UIButton!
    @IBOutlet weak var addPeopleButton: UIButton!
    @IBOutlet weak var randomizeButton: UIButton!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = CoreDataHelper.retrieveGroup()
        
        addChoresButton.layer.cornerRadius = 6
        addPeopleButton.layer.cornerRadius = 6
        randomizeButton.layer.cornerRadius = 6
        
        var index = 1
        
        let group = groups[index-1]

        self.navTitle.title =  group.groupsName
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func addChoresButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addPeopleButtonTapped(_ sender: Any) {
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
    }
    
    
    
}
