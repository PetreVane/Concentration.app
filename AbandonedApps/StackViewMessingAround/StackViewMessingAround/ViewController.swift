//
//  ViewController.swift
//  StackViewMessingAround
//
//  Created by Petre Vane on 04/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstInts = 0
    var intsOnScreen = 0
    var nextInt = 0
    var pressedIndex = 0 // counts the number of time a button is pressed
    
    
    @IBOutlet weak var screen: UILabel!
    
    
    @IBAction func intButtonPressed(_ sender: UIButton) {
        
            screen.text?.append(String(sender.tag))
            firstInts = Int(screen.text!)!
            print(sender.tag)
        
        switch sender.tag {
        case 10:
            screen.text?.append("")
            print(firstInts)
            print(screen)
        default:
            print("something else")
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

