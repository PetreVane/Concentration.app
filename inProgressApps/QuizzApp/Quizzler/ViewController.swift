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
    var score = 0
    
    
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        nextQuestion()
        
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
        
        checkAnswer()
        nextQuestion()
        
        
        }
    
    func checkAnswer() {
        guard questionNumber <= 12 else {
            return
        }
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            print("This is correct")
            score += 1
        } else {
            print("Wrong answer")
        }
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        // CGFloat -> Core Grafic Float number
        
    }
    
    
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            questionNumber += 1
            updateUI()
            print("You're at question number: \(questionNumber)")
        
        } else{
            let alert = UIAlertController(title: "Awesome", message: "This was the last question. Would you care for one more try?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Game", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            
            })
          
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    

        
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
        
        
    }

}


    
    

    

    

