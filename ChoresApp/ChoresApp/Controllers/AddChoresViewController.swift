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

    var chore: [String] = [] {
        didSet {
            print("set \(chore)")
        }
    }
    
    @IBOutlet weak var choreTextField: UITextField!
    @IBOutlet weak var saveChoreButton: UIButton!
    
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
        case "saveChore":
//            if let text = choreTextField.text {
//                if choreTextField.text != "" {
//                    chore.append(text)
//                } else {
//                    choreTextField.text = ""
//                }
//            }
            
            if choreTextField.text != nil && choreTextField.text != "" {
                let choreItem = choreTextField.text
                self.chore.append(choreItem!)
            }
            print(self.chore)
        case "cancelChore":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    
    
}
