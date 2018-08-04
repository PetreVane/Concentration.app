//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
// ReCreated by Petre Vane on July 2018
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // creating a list of sounds
    let soundsList = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    // creating an object of AVAudioPlayer, which plays the sounds
    var audioPlayer: AVAudioPlayer!
    
    // creating a placeholder for sender.tag, which will point to corresponding sound, when a button is pressed
    var selectedSound = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func notePressed(_ sender: UIButton) {
        selectedSound = soundsList[sender.tag - 1]
        
        playSound()
        
    }
    
    // playing a sound
    func playSound () {
        
        // creating a link to local sound file
        let soundLocation = Bundle.main.url(forResource: selectedSound, withExtension: "wav")
        // attempting to play the sound
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOf: soundLocation!)
            
        } catch {
            print(error)
        }
        audioPlayer.play()
        
    }

}

