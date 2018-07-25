//
//  ViewController.swift
//  MoonLight
//
//  Created by Petre Vane on 06/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let morningTasks = ["Wake up early", "Brush your teeth","Make coffee"]
    
    let midDayTasks = ["Have lunch", "Have a coffe", "Think positively"]
    
    let eveningTasks = ["Go to gym", "Have a shower", "Read something"]
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch  section {
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
        let cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = eveningTasks[indexPath.row]
        case 1:
            cell.textLabel?.text = midDayTasks[indexPath.row]
            //cell.textLabel?.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 2:
            cell.textLabel?.text = morningTasks[indexPath.row]
        default:
            cell.textLabel?.text = "You shouldn't ever hit this"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        switch section {
        case 0:
            return "Morning Tasks"
        case 1:
            return "Mid Day Tasks"
        case 2:
            return "Evening Tasks"
        default:
            return nil
        }
    }
    
    
    @IBAction func changeColor(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        
    
        
    
        
        
        //get everyting in the top-level view
        
//        let everyLabel = view.subviews
//
//        //separate UILabel objects from other objects
//        for eachLabel in everyLabel {
//            // is it a label?
//           if eachLabel is UILabel {
//                // downcast as UILabel
//                let currentLabel = eachLabel as! UILabel
//                // changing text color
//                if view.backgroundColor == #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
//                    currentLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
//                } else {
//                    currentLabel.textColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
//                }
//
//    }
//}
}




}

