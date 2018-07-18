//
//  ViewController.swift
//  DiceGame
//
//  Created by Petre Vane on 18/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // declaring variables for random values
    var randomDiceIndex = 0
    var randomDiceIndex2 = 0
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // list of images
    let diceImages = [#imageLiteral(resourceName: "Dice 1"), #imageLiteral(resourceName: "Dice 2"), #imageLiteral(resourceName: "Dice 3"), #imageLiteral(resourceName: "Dice 4"), #imageLiteral(resourceName: "Dice 5"), #imageLiteral(resourceName: "Dice 6")]
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
       
    }
    
    func updateDiceImages() {
        // generating random numbers
        randomDiceIndex = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        // selecting random images
        diceImageView1.image = diceImages[randomDiceIndex]
        diceImageView2.image = diceImages[randomDiceIndex2]
        
    }
    
    
    override func viewDidLoad() {
        // updating the view
        updateDiceImages()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


