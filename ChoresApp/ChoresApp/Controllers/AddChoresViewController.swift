//
//  AddChoresViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/27/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//


import Foundation
import UIKit



class AddChoresViewController: UIViewController {

    var chore: Chore?
    
    @IBOutlet weak var choreTextField: UITextField!
    @IBOutlet weak var saveChoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        saveChoreButton.layer.cornerRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        if let chore = chore {
            choreTextField.text = chore.choreItem
        } else {
            choreTextField.text = ""
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
       
        switch identifier {
        case "saveChore" where chore != nil:
            
            chore?.choreItem = choreTextField.text ?? ""
            
            CoreDataHelper.saveChore()
            
        case "saveChore" where chore == nil:
            let chore = CoreDataHelper.newChore()
            chore.choreItem = choreTextField.text ?? ""
            
            CoreDataHelper.saveChore()
        case "cancelChore":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
