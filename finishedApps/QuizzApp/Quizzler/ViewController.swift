//
//  ViewController.swift
//  Quizzler
//
//  Created by Petre Vane on 24/07/2018.
//  Copyright (c) 2018 OrbSec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // The UI Elements from StoryBoard
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
   
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber = 0
    var score = 0
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

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
        questionNumber += 1
        updateUI()

        }
    func updateUI() {
    
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        // CGFloat -> Core Grafic Float number
        progressLabel.text = String(questionNumber) + "/13"
        scoreLabel.text = "Score: \(score)"
        nextQuestion()
    
    }
    
    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
        } else {
            let alert = UIAlertController(title: "Awesome", message: "This was the last question. Would you care for one more try?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Game", style: .default, handler: { (UIAlertAction) in
                self.startOver()
                
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong Answer!")
        }
        
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        updateUI()
        
    }

}


    
    

    

    

