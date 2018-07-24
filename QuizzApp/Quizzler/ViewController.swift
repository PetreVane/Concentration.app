//
//  ViewController.swift
//  Quizzler
//
//  Created by Petre Vane on 24/07/2018.
//  Copyright (c) 2018 OrbSec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // creating an object of QuestionBank
    let allQuestions = QuestionBank()
    // creating a placeholder for the selected answer
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    
    
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        // tapping into the questionBank, first question.
        let firstQuestion = allQuestions.list[0]
        // getting the firstQuestion on the screen
        questionLabel.text = firstQuestion.questionText
        
        super.viewDidLoad()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
// saving the selected answer into the placeholder, for comparison with the firstQuestion.correctAnswer property
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        // moving to the next question
        questionNumber += 1
        // updating the label on the move and staying within the array's boundaries
    
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
    
    func checkAnswer() {
        // another way of tapping into the questionBank in one line of code:
        //let firstQuestion = allQuestions.list[0]
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print ("You've got it")
        } else {
            print("Wrong answer")
        }
        
    }
    func updateUI() {
        
    }
    
    
    func nextQuestion() {
        
        
    }
    
    
    
    
    func startOver() {
        
    }
    
        
    }
    
    


    
    

    

    

