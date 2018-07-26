//
//  ListChoresTableViewCell.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/25/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit

protocol ChoresCellDelegate {
    func textFieldUpdated(text: String, index: Int)
}
class ListChoresTableViewCell: UITableViewCell {

    var delegate: ChoresCellDelegate?
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func textFieldEdited(_ sender: Any) {
        guard let delegate = delegate,
            let text = textField.text else {return}
        delegate.textFieldUpdated(text: text, index: tag)
    }
    

    
    
}
