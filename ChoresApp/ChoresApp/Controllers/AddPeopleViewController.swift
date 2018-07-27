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
    
    var people: [String] = []
    
    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var savePersonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "savePerson":
            if let text = personTextField.text {
                if personTextField.text != "" {
                    people.append(text)
                } else {
                    personTextField.text = ""
                }
            }
            
            print(people)
        case "cancelPerson":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
