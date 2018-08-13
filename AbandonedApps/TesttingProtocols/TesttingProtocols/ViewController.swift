//
//  ViewController.swift
//  TesttingProtocols
//
//  Created by Petre Vane on 13/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {
    

    
    var dataPassedBack = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBAction func firstButtonPressed(_ sender: UIButton) {
        // once you've declared a segue, which passes data between view controllers, you just have to call the segue
        
        performSegue(withIdentifier: "sendDataForward", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForward" {
            
            // set the destination of your segue
            let secondVC = segue.destination as! SecondViewController
            // send the text to secondVC
            secondVC.data = firstTextField.text!
            secondVC.delegate = self
            
            
        }
    }
    
    func dataPassed(data: String) {
        
        //firstTextField.text = data
        firstLabel.text = data
    }
    
    
    
    
}

