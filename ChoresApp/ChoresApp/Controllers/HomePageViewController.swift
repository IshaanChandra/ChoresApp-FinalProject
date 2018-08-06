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
import SafariServices

class HomePageViewController: UIViewController, UITextFieldDelegate {
    
    var groups = [Group]()
    var chores = [Chore]() {
        didSet {
            tableView.reloadData()
        }
    }
    var displayedChores: [Chore] = []
    
    @IBOutlet weak var addChoresButton: UIButton!
    @IBOutlet weak var addPeopleButton: UIButton!
    @IBOutlet weak var randomizeButton: UIButton!
    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chores = CoreDataHelper.retrieveChores()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = CoreDataHelper.retrieveGroup()
        
        
        addChoresButton.layer.cornerRadius = 6
        addPeopleButton.layer.cornerRadius = 6
        randomizeButton.layer.cornerRadius = 6
        
        let group = groups.last

        self.navTitle.title =  group?.groupsName
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        chores = CoreDataHelper.retrieveChores()
        insertNewChore()
    }
    
    @IBAction func addChoresButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addPeopleButtonTapped(_ sender: Any) {
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
    }

    func insertNewChore() {
        displayedChores.append(chores.last!)
        
        tableView.reloadData()
        view.endEditing(true)
    }
    
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chores.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newChore = chores[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoreCell") as! ChoreCell
        cell.choreTextLabel.text = newChore.choreItem
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            chores.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    
}
