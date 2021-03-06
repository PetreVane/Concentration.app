//
//  ViewController.swift
//  TableView Demo
//
//  Created by Petre Vane on 06/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // adopting and conforming the protocol UITableViewDataSource
    // only two methods are required
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // add the number of rows you wish
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // printing the number of rows
        cell.textLabel?.text = "Testing \(indexPath.row)"
        cell.textLabel?.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

