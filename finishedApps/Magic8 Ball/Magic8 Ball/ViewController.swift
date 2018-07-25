//
//  ViewController.swift
//  Magic8 Ball
//
//  Created by Petre Vane on 19/07/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // declaring a holder for random numbers
    var randomIndex: Int = 0
    
    @IBOutlet weak var imageChange: UIImageView!
    
    // declaring an array of images
    let listOfImages = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]
    
    func updateImages() {
        // assigning a random index to a variable
        randomIndex = Int(arc4random_uniform(UInt32(listOfImages.count)))
        // using random index to change the images
        imageChange.image = listOfImages[randomIndex]
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //calling the update method when buttonPressed
        updateImages()
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateImages()
    }

    override func viewDidLoad() {
        updateImages()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

