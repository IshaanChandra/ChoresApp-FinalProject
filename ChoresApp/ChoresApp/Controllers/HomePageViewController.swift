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

class HomePageViewController: UIViewController, UITextFieldDelegate {
    
    var groups = [Group]()
    var chores = [Chore]() {
        didSet {
            tableView.reloadData()
        }
    }
    var displayedChores: [Chore] = []
    var people = [People]() {
        didSet {
            tableView.reloadData()
        }
    }
    var displayedPeople: [People] = []
    
    var choresCount = Int()
    var peopleCount = Int()
    
    var choresIndex: Int = 0
    var peopleIndex: Int = 0
    
    @IBOutlet weak var addChoresButton: UIButton!
    @IBOutlet weak var addPeopleButton: UIButton!
    @IBOutlet weak var randomizeButton: UIButton!
    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var broomImg: UIImageView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chores = CoreDataHelper.retrieveChores()
        people = CoreDataHelper.retrievePerson()
        
        if chores.count == 0 {
            broomImg.isHidden = false
        } else {
            broomImg.isHidden = true
        }
        
        choresCount = chores.count
        peopleCount = people.count
        
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
        
        if segue.identifier == "saveChore" {
            chores = CoreDataHelper.retrieveChores()
            choresIndex = choresIndex + 1
            insertNewChore()
        }
        
        if segue.identifier == "savePerson" {
            people = CoreDataHelper.retrievePerson()
            peopleIndex = peopleIndex + 1
            insertNewPerson()
        }
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
    
    func insertNewPerson() {
        displayedPeople.append(people.last!)
        
        tableView.reloadData()
        view.endEditing(true)
    }
    
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chores.count + people.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoreCell") as! ChoreCell
        
       
        
        
        if choresIndex == choresCount {
            let newChore = chores[indexPath.row]
            cell.choreTextLabel.text = newChore.choreItem
        }
        
        if peopleIndex == peopleCount {
            let newPerson = people[indexPath.row]
            cell.choreTextLabel.text = newPerson.person
        }
        

        
        
        cell.choreViewCell.layer.cornerRadius = 5.0
        cell.choreViewCell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.choreViewCell.layer.shadowOffset = .zero
        cell.choreViewCell.layer.shadowOpacity = 0.6
        cell.choreViewCell.layer.shadowRadius = 5.0
        cell.choreViewCell.layer.shadowPath = UIBezierPath(rect: cell.choreViewCell.bounds).cgPath
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
//        if editingStyle == .delete {
//            chores.remove(at: indexPath.row)
//
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
        
        if editingStyle == .delete {
            let choreToDelete = chores[indexPath.row]
            CoreDataHelper.delete(chore: choreToDelete)
            
            chores = CoreDataHelper.retrieveChores()
        }
        
    }

}

