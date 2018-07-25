//
//  ViewController.swift
//  Another TableView
//
//  Created by Petre Vane on 09/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text = "Here is your cell number \(indexPath.row) "
//        switch indexPath.section {
//        case 0, 1, 2:
//            cell.textLabel?.text = "here is section \(indexPath.section) and cell \(indexPath.row)"
//        default:
//            cell.textLabel?.text = "You should not get this"
//        }
        return cell
    }
    

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 300
//        switch section {
//        case 0:
//            return 25
//        case 1:
//            return 25
//        case 2:
//            return 25
//        default:
//            return 0
//        }
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

