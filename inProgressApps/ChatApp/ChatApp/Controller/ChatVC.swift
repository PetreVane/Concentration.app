//
//  ChatVC.swift
//  ChatApp
//
//  Created by Petre Vane on 27/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    
    // Outlet
    
    
    @IBOutlet weak var menuButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // Swiping menu with your finger gesture:
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Taping gesture:
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
