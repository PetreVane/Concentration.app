//
//  Second ViewController.swift
//  TesttingProtocols
//
//  Created by Petre Vane on 13/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

protocol CanReceive {
    
    func dataPassed(data: String)
    
}

class SecondViewController: UIViewController {
    
    
    var delegate: CanReceive?
    var data: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        secondLabel.text = data

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBAction func secondButtonPressed(_ sender: UIButton) {
        // Delegator (data Pusher of Second View Controller)
        delegate?.dataPassed(data: secondTextField.text!)
        dismiss(animated: true, completion: nil)
        
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
