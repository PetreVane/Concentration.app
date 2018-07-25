//
//  ViewController.swift
//  FlippingCards
//
//  Created by Petre Vane on 17/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // creating an object of newly created class
   lazy var game = FlippingCards(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    
    // you cannot use property observers with lazy variables (which are not completly initialized)
    
    // declaring a property observer that counts the flips
    
    var flipCount = 0 {
         // updating the label with the nr of flips
        didSet {
            FlipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
    // Connecting the label from SotryBoard to ViewController
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    // Creating an array of cards from StoryBoard with Outlet Collection
    @IBOutlet var cardButtons: [UIButton]!
    
    
    // creating an IBAction from StoryBoard to code
    
    // later, all the cards are connected to this function
    @IBAction func touchCard(_ sender: UIButton) {
     
        // Unwrapping emoji's from UIButton array (the return value of the array is an optional)
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            // if the unwrapped value is not nil, the execution continues
            // calling the flipCard function while the first argument is the array "emojiChoices" sub "cardNUmber"
            // flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
            flipCount += 1 // counting the flips
        }
       
    }
    
    func updateViewFromModel () {
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle(" ", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                
            }
            
        }
    }
    
    // declaring an array of emoji's
    var emojiChoice = ["🤫", "🧐", "🤥", "🎃", "😎", "🐑", "🦋 ", "🧠"]
    var emoji: [Int:String] = [:]
    
    func emoji (for card: Cards) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoice.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
                emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
            }
            
        }
        
        return emoji[card.identifier] ?? "?"
//        if emoji[card.identifier] != nil {
//            return emoji[card.isMatched]!
//        } else {
//        return "?"
    }
    
   
    }
    
    
    


