//
//  ViewController.swift
//  Quizzler
//
//  Created by Petre Vane on 24/07/2018.
//  Copyright (c) 2018 OrbSec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    
    
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
    
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
        super.viewDidLoad()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
// holds the selected answer, for comparison with the firstQuestion.correctAnswer property
         //sender.tag == 1 ? pickedAnswer = true : pickedAnswer = false
        
        if sender.tag == 1 {
            pickedAnswer = true

        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        nextQuestion()
        checkAnswer()
        
        }
    
    func checkAnswer() {
        guard questionNumber <= 12 else {
            return
        }
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            print("This is correct")
        } else {
            print("Wrong answer")
        }
        
    }
    
    func updateUI() {
        
    }
    
    
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            questionNumber += 1
            print("You're at question number: \(questionNumber)")
        
        } else{
            let alert = UIAlertController(title: "Alert", message: "End of line dude!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Game", style: .default) { (<#UIAlertAction#>) in
                self.startOver()
            }
            alert.addAction(restartAction)
        }
    
    
    
    
    func startOver() {
        
        
        
    }
    
        
    }

}


    
    

    

    

