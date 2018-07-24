//
//  Question.swift
//  Quizzler
//
//  Created by Petre Vane on 24/07/2018.
//  Copyright © 2018 OrbSec . All rights reserved.
//

import Foundation

class Question {
    
    var questionText: String
    var answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}


