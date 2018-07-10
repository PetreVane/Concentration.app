//
//  ViewController.swift
//  MoonLight2
//
//  Created by Petre Vane on 10/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let morningTasks = ["Wake up early", "Brush your teeth","Make coffee"]
    let midDayTasks = ["Have lunch", "Have a coffe", "Think positively"]
    let eveningTasks = ["Go to gym", "Have a shower", "Read something"]

    // Declraring the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // Setting up the number of rows in each section
    // This method accepts 2 prameters, but the second parameters expects 2 integers: 1. the number of the section; 2. the number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return morningTasks.count
        case 1:
            return midDayTasks.count
        case 2:
            return eveningTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creating an instance of class "UITableViewCell"
        // Expects an index path for locating a row in tableView
        
        let cell = UITableViewCell()
        
        // setting the background for cells
        cell.backgroundColor = UIColor.white
      
        // Since the table has also 3 sections, I need to declare a Switch case
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = eveningTasks[indexPath.row]
        case 1:
            cell.textLabel?.text = midDayTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = morningTasks[indexPath.row]
            //cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            //cell.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        default:
            cell.textLabel?.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            cell.textLabel?.text = "You should not be here!"
        }
        
        return cell
    }
    
    // Adding title for each Section
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    
        switch section {
        case 0:
            return "Evening Tasks"
        case 1:
            return "MidDay Tasks"
        case 2:
            return "Morning Tasks"
        default:
            return nil
        }
    }
    
 
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

