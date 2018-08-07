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
        
        if chores.count == 0 && people.count == 0 {
            broomImg.isHidden = false
        } else {
            broomImg.isHidden = true
        }

        
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
        
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.767149806, green: 0.3626476526, blue: 1, alpha: 1)
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
        if segue.identifier == "saveChore" {
            chores = CoreDataHelper.retrieveChores()
            
            insertNewChore()
        }
        
        if segue.identifier == "savePerson" {
            people = CoreDataHelper.retrievePerson()
            
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0: return "People"
        case 1: return "Chores"
        default: fatalError("Index out of range!")
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        header.textLabel?.font = UIFont.systemFont(ofSize: 20)
       // header.textLabel?.frame = header.frame
        //header.textLabel?.textAlignment = .left
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch  section {
        case 0: return people.count
        case 1: return chores.count
    
        default:
            fatalError("oo")
        }
        
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoreCell") as! ChoreCell
 
        
        switch indexPath.section{
            
        case 0:
            if people.count != 0 {
                let newPerson = people[indexPath.row]
                cell.choreTextLabel.text = newPerson.person
            }
            
        case 1:
            if chores.count != 0 {
                let newChore = chores[indexPath.row]
                cell.choreTextLabel.text = newChore.choreItem
            }
            
        default: fatalError("Poo")
        }
        
        
        cell.choreViewCell.layer.cornerRadius = 5.0
        cell.choreViewCell.layer.shadowColor = UIColor.gray.cgColor
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
        
        if editingStyle == .delete {
            
            
            switch indexPath.section{
            case 0:
                let personToDelete = people[indexPath.row]
                CoreDataHelper.delete(person: personToDelete)
                people = CoreDataHelper.retrievePerson()
            case 1:
                let choreToDelete = chores[indexPath.row]
                CoreDataHelper.delete(chore: choreToDelete)
                
                chores = CoreDataHelper.retrieveChores()
            default:
                fatalError("fatal")
            }
        }
        
        
    }
    
}

