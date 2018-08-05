//
//  Car.swift
//  Classes&Objects
//
//  Created by Petre Vane on 05/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import Foundation

enum CarType {
    case sedan
    case hatchback
    case coupe
    
}

class Car {
    
    var typeOfCar: CarType = .hatchback
    var model: String
    var yearOfManufacturing: Int
    var factoryLocation: String
    var modelNumber: Double
    var startingPrice: Double
    var colour: String
    
    
    init() {
        self.colour = "black"
        self.model = "default"
        self.yearOfManufacturing = 2018
        self.factoryLocation = "Denmark"
        self.modelNumber = 1.0
        self.startingPrice = 10000
    }
    
    convenience init(chosenColor: String) {
        self.init()
        colour = chosenColor
    }
    
    func getDetails() {
        print("Your car is \(typeOfCar), model: \(model) \(modelNumber), manufactured in \(factoryLocation), colored \(colour) and costs \(startingPrice) Euro")
    }
    
}






