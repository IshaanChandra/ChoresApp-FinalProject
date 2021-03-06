//
//  AddPeopleViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/27/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit



class AddPeopleViewController: UIViewController {
    
    var people: People?
    
    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var savePersonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        savePersonButton.layer.cornerRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let people = people {
            personTextField.text = people.person
        } else {
            personTextField.text = ""
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "savePerson" where people != nil:
            people?.person = personTextField.text ?? ""
            
            CoreDataHelper.savePerson()
            
        case "savePerson" where people == nil:
            let people = CoreDataHelper.newPerson()
            people.person = personTextField.text ?? ""
            
            CoreDataHelper.savePerson()
        
        case "cancelPerson":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
