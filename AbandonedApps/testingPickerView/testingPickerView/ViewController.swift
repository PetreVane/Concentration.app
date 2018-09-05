//
//  ViewController.swift
//  testingPickerView
//
//  Created by Petre Vane on 05/09/2018.
//  Copyright © 2018 Petre Vane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
       currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }

    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var currencyList =  ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    // how many rows should the picker have
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // how many elements should the picker contain
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyList.count
    }
    
    // what should fill in each element
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyList[row]
    }
    
    // what should happen when one element is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(row)
    }
}

