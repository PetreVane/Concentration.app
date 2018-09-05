//
//  ViewController.swift
//  BitcoinTicker
//  Author Petre Vane on September 5, 2018
//
// 

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbol = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "RON", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    // how many rows should the picker have
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // how many elements should the picker contain
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    // what should each element of the picker contain
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //var selectedCurrency = currencyArray[row]
        //print(currencyArray[row])
        return currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        //print(currencyArray[row])
        finalURL = baseURL + currencyArray[row]
        bitcoinPriceLabel.text? = currencySymbol[row]
        //print(finalURL)
        getBitCoinData(url: finalURL)
        
    }
  
//    //MARK: - Networking
//    /***************************************************************/

    func getBitCoinData(url: String) {

        Alamofire.request(finalURL, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    //print("Sucess! Got the bitcoin data")
                    let bitcoinJSON: JSON = JSON(response.result.value!)
                    //print (bitcoinJSON)

                    self.updateBitCoinData(json: bitcoinJSON)

                } else {
                    
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }
        
    }
    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//

    func updateBitCoinData(json: JSON) {
        
        if let bitCoinDataResult = json["ask"].double {
            
            bitcoinPriceLabel.text?.append(contentsOf: String(bitCoinDataResult))
            
        } else {
            
            bitcoinPriceLabel.text = "cannot get data"
        }
        
        
    }



}

