//
//  ChoresViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/25/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit



class ChoresViewController: UITableViewController, ChoresCellDelegate {
    func textFieldUpdated(text: String, index: Int) {
        print(text)
    }
    
    

    var chores: [Chore] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //eturn chores.count
        return 15
    }

    //Assigns which cell goes to which row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListChoresTableViewCell", for: indexPath) as! ListChoresTableViewCell
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "addPeople":
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            for choreInput in 0..<15 {
               // chores.append()
            }
            //chore.name = textField.text!
//            for row in 0..<15 {
//                print(row)
//                let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! ListChoresTableViewCell
//                let text = cell.textField.text
//                var chore = Chore(context: context)
//                chore.name = text
//                chores.append(chore)
//            }
            
            
           (UIApplication.shared.delegate as! AppDelegate).saveContext()
           // navigationController!.popViewController(animated: true)
            
            print("save chores bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
}

