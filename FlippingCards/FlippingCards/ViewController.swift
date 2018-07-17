//
//  ViewController.swift
//  FlippingCards
//
//  Created by Petre Vane on 17/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // declaring a property observer that counts the flips
    
    var flipCount = 0 {
         // updating the label with the nr of flips
        didSet {
            FlipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // Connecting the label from SotryBoard to ViewController
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    // Creating an array of cards from StoryBoard with Outlet Collection
    @IBOutlet var cardButtons: [UIButton]!
    
    // declaring an array of emoji's
    var emojiChoice = ["🤫", "🧐", "🤥", "😎", "😎", "🤥", "🤫", "🧐"]
    
    // creating an IBAction from StoryBoard to code
    
    // later, all the cards are connected to this function
    @IBAction func touchCard(_ sender: UIButton) {
     
        flipCount += 1 // counting the flips
       
        // Unwrapping emoji's from UIButton array (the return value of the array is an optional)
        if let cardNumber = cardButtons.index(of: sender) {
            // if the unwrapped value is not nil, the execution continues
            // calling the flipCard function while the first argument is the array "emojiChoices" sub "cardNUmber"
            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        }
       
    }
    
    // Declaring a function that flips the cards
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        
        // check the current state of button
        
        if button.currentTitle == emoji {
            button.setTitle(" ", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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

