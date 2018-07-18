//
//  ViewController.swift
//  DiceGame
//
//  Created by Petre Vane on 18/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomDiceIndex = 0
    var randomDiceIndex2 = 0
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        randomDiceIndex = Int(arc4random_uniform(7))
        randomDiceIndex2 = Int(arc4random_uniform(7))
        print (randomDiceIndex)
        //diceImageView1.image
        
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

