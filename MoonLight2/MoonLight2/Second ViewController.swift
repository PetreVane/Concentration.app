//
//  Second ViewController.swift
//  MoonLight2
//
//  Created by Petre Vane on 10/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class Second_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Second Page"

        // Do any additional setup after loading the view.
    }
    var flipCounts = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCounts)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcard(withEmoji: "🐶", on: sender)
        flipCounts += 1
    }
    
    @IBAction func touch2Card(_ sender: UIButton) {
        flipcard(withEmoji: "🐑", on: sender)
        flipCounts += 1
    }
    
    @IBAction func touch3Card(_ sender: UIButton) {
        flipcard(withEmoji: "🤪", on: sender)
        flipCounts += 1
    }
    
    @IBAction func touch4Card(_ sender: UIButton) {
        flipcard(withEmoji: "💍", on: sender)
        flipCounts += 1
        
    }
    
    
    func flipcard(withEmoji emoji:  String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle(" ", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
