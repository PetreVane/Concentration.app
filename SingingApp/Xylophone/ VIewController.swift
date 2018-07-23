//
//  ViewController.swift
//  Xylophone
//
//  Created by Petre Vane on 23/07/2018.
//  
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
// creating an object
    var audioPLayer: AVAudioPlayer!
    
// getting all the sounds within an array
    var listOfSounds = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
// creating a placeholder for sender.tag number, which will point to an index of the listOfSounds
   // var selectedSound: String = ""
    
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        // pointing to an index of the listOfSounds, based on each tag of the sender
        // var selectedSound = listOfSounds[sender.tag - 1]
        
        playSound(selectedSound: listOfSounds[sender.tag - 1])
        
    }
    
    func playSound(selectedSound: String) {
        
// creating a url to the local soundfile
        let soundUrl = Bundle.main.url(forResource: selectedSound, withExtension: "wav")
        
// attempting to play the sound
        do {
            audioPLayer = try AVAudioPlayer.init(contentsOf: soundUrl!)
            
        } catch {
            print(error)
        }
        
        audioPLayer.play()
    }
    
        
    }
    
   



