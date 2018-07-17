//
//  Cards.swift
//  FlippingCards
//
//  Created by Petre Vane on 17/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import Foundation

struct Cards {
    // declaring few properties of the Card
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    /* because you're in the Model, not in the View (UI), you don't specify that the card has an emoji on.
     The emoji is an UI element and these elements are declared in the View.
 
 */
    // creating a static var, which is associated with the Type Cards, not with each instance of Cards.
    
    static var identifierfactory = 0
    
    // creating a static function
    
    static func getUniqueIdentifier () -> Int {
        Cards.identifierfactory += 1
        return Cards.identifierfactory
    }
    
    init() {
        self.identifier = Cards.getUniqueIdentifier()
    }
}

