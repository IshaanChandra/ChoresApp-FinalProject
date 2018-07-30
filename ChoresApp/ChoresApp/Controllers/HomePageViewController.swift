//
//  HomePageViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/26/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var addChoresButton: UIButton!
    @IBOutlet weak var addPeopleButton: UIButton!
    @IBOutlet weak var randomizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
