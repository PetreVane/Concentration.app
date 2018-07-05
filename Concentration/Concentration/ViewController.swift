//
//  ViewController.swift
//  Concentration
//
//  Created by Petre Vane on 30/06/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //This class inherits from UIViewController, which handles everyting in the UI
    
    
// setting a property for the class which sets the flipCountlabel
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
// Label connection
    @IBOutlet weak var flipCountLabel: UILabel!
    
// Declaring an array of UIButton
    @IBOutlet var cardButtons: [UIButton]!
    var emojiChoices = ["🥙", "🍫", "🎾", "🍫 ", "🎾", "🥙"]

    //Connecting UI objects to method
    @IBAction func touchCard(_ sender: UIButton) {
     
// Counting how many times a card has flipped
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }

    }
    
//  The flipping cards method
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle(" ", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

