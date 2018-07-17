//
//  FlippingCards.swift
//  FlippingCards
//
//  Created by Petre Vane on 17/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import Foundation


class FlippingCards {
    
    /* Declare an array that holds the cards.
     But first you'll ned to declare the struct that describes the Cards in another file. Once you're done, create an object of the Cards struct here.
    */
    var cards = [Cards]()
    //var numberOfPairOfCards: Int
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    
// declare a function that allows for searching cards based on their index
    func chooseCard(at index: Int) {
        if !cards[index] .isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
        
        
//        if cards[index].isFacedUp {
//            cards[index].isFacedUp = false
//        } else {
//            cards[index].isFacedUp = true
//        }
        
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 1...numberOfPairOfCards {
                let card = Cards()
                cards.append(card)
                cards.append(card)
            // or: card += [card, card]

            }
        // TO DO: Shuffle the cards
        }
    }


