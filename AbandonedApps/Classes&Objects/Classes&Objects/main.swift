//
//  main.swift
//  Classes&Objects
//
//  Created by Petre Vane on 05/08/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import Foundation

var myCar = Car()
myCar.typeOfCar = .sedan
myCar.factoryLocation = "Odense"

print(myCar.getDetails())

var mySecondCar = Car(chosenColor: "BloodyRed")
print(mySecondCar.getDetails())


var myThirdCar = SelfDrivingCar()
print(myThirdCar.getDetails())


var name: String?
var lastName = "Pete"
name = "Lane"

var availableName = name ?? lastName
print(availableName)
