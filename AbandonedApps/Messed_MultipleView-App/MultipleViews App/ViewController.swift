//
//  ViewController.swift
//  MultipleViews App
//
//  Created by Petre Vane on 10/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
  // declaring a dictionary and an array
    
    let names = ["student", "teacher", "doctor"]
    let dayTime = ["morning", "afternoon", "evening"]
    
// declaring the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
// declaring the number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return names.count
        case 1:
            return dayTime.count
        default:
            return 0
        }
    }
 // declaring the content of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    // creating an instance of UITableViewCell and returning it, as the func requires
        let cell = UITableViewCell()
        
    // ensuring the cell content for each section
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Section no: \(indexPath.section); cell no: \(names[indexPath.row])"
        case 1:
            cell.textLabel?.text = "Section no: \(indexPath.section); cell no: \(dayTime[indexPath.row])"
        default:
            cell.textLabel?.text = "You sould not be here"
        }
        
        
        return cell
        
    }
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "First View Controller"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

