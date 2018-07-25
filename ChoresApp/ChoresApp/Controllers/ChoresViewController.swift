//
//  ChoresViewController.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/25/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import UIKit



class ChoresViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    //Assigns which cell goes to which row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listChoresTableViewCell", for: indexPath) as! ListChoresTableViewCell

        return cell
    }
    
    
}
