//
//  SelfDriving Car.swift
//  Classes&Objects
//
//  Created by Petre Vane on 05/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    
    var myPersonalColor: String
    
    override init() {
        self.myPersonalColor = "SkyBlue"
    }
  
    override func getDetails() {
        super.getDetails()
        print("Your car is \(typeOfCar), model: \(model) \(modelNumber), manufactured in \(factoryLocation), colored \(myPersonalColor) and costs \(startingPrice) Euro")
    }
        
    }
    

