//
//  ViewController.swift
//  WeatherApp
//
//  ReCreated by Petre Vane on 4/08/2018.
//  Copyright (c) 2018 OrbSec. All rights reserved.

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
 
    
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "53d4547cd3b9977670e131977f1afba2"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel() // object of Weather Data class
    
    
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // determines the accuracy of your location
        locationManager.requestWhenInUseAuthorization()
        // asks for tracking location
        locationManager.startUpdatingLocation()

        /*
         Starts updating user location in the background. Once the location has been found, it will send a message to the ViewController (the delegate).
         In order to receive the location, you have to update the method 'didUpdateLocation()' bellow.
        */
        //TODO:Set up the location manager here.
    
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func  getWeatherData(url: String, params: [String: String]) {
        
        Alamofire.request(url, method:.get, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                print("Succcess, you've got the weather Data")
                
                let weatherJSON: JSON = JSON(response.result.value!)
                // getting the value of the response
                // casting the value in JSON -> this comes from SwiftyJSON, not from Swift
                //print(weatherJSON)
                self.updateWeatherData(json: weatherJSON)
                
                
            } else {
                print("Error: \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection issues"
            }
        }
        
    }
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(json: JSON) {
        
        // you'll want to get the temperature, so declare a placeholder
        // this is how to navigate within the JSON formatted data, thanks to SwiftyJSON
        if let tempResults = json["main"]["temp"].double { // converts JSON into double
            weatherDataModel.temperature = Int(tempResults - 273.15)
            // convers double to Int, while transforming kelvin to Celsius
            
            weatherDataModel.city = json["name"].stringValue
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            weatherDataModel.weatherIcon = weatherDataModel.updateWeatherIcon(conditionCode: weatherDataModel.condition)
            
            updateUIWithWeatherData()
        } else {
            cityLabel.text = "weather unavailable"
        }
        
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    func updateUIWithWeatherData(){
        
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temperature)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIcon)
    }
   
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation = locations[locations.count - 1]
        // getting the most accurate location, of all attempts stored in [CLLocation] array
        if myLocation.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            locationManager.delegate = nil
            // while in the process of stoping the locationManager, you might get some extra JSON responses.
            // To avoid that, set the locationManager.delegate to nil.
            
// print("Longitude: \(myLocation.coordinate.longitude) and Latitude: \(myLocation.coordinate.latitude)")
            let longitude = String(myLocation.coordinate.longitude)
            let latitude = String(myLocation.coordinate.latitude)
            
            let parameters: [String: String] = ["lat": latitude, "lon": longitude, "appid": APP_ID]
            
            getWeatherData(url: WEATHER_URL, params: parameters)
            
        }
        
    }
    // This is the method that gets activated, once the LocationManager has a location.
    // Tells the delegate ( WeatherViewController) that the LocationManager has a location.
    
    
    
    
    //Write the didFailWithError method here:
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location unavailable"
    }
     // this gets executed when the LocationManager fails in getting a location

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
//    func userEnterNewCityName(city: String) {
//        cityLabel.text = city
//    }
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnterNewCityName(city: String) {
        
        let params: [String: String] = ["q" : city, "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, params: params)
        updateUIWithWeatherData()
        
        
    }

    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            
            let secondViewController = segue.destination as! ChangeCityViewController
            secondViewController.delegate = self
            
        }
    }
    
    // MARK: - Add extra functionalities
    /***************************************************************/
    
    
    
    
}


