//
//  ViewController.swift
//  BitcoinTicker
//
// 

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
        return currencyArray[row]
        
    }
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD"
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        //print (type(of: currencyArray[row]))
        
        //print(finalURL)
    }
    

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
    func getCurrencyPrice(url: String) {

        Alamofire.request(baseURL, method:.get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the currency  data")
                    let priceJSON : JSON = JSON(response.result.value!)
                    print (priceJSON)

                    self.updateBitCoinPrice(json: priceJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }
        
    }

//
//    
//    
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
//    func updateWeatherData(json : JSON) {
//        
//        if let tempResult = json["main"]["temp"].double {
//        
//        weatherData.temperature = Int(round(tempResult!) - 273.15)
//        weatherData.city = json["name"].stringValue
//        weatherData.condition = json["weather"][0]["id"].intValue
//        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
//        }
//        
//        updateUIWithWeatherData()
//    }
//    

    func updateBitCoinPrice (json: JSON) {
        
        if let bitcoinPriceResults = json["main"]["changes"]["price"].double {
            
            bitcoinPriceLabel.text = String(bitcoinPriceResults)
         
            
        } else {
            bitcoinPriceLabel.text = "cannot get data"
        }
        
        
    }



}

