//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  ReCreated by Petre Vane on 4/08/2018.
//  Copyright (c) 2018 OrbSec. All rights reserved.

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "53d4547cd3b9977670e131977f1afba2"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    
    
    
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
    

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
   
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation = locations[locations.count - 1]
        if myLocation.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
// print("Longitude: \(myLocation.coordinate.longitude) and Latitude: \(myLocation.coordinate.latitude)")
            let longitude = String(myLocation.coordinate.longitude)
            let latitude = String(myLocation.coordinate.latitude)
            
            var parameters: [String: String] = ["lat": latitude, "lon": longitude, "appid": APP_ID]
            
            
            
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
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    // MARK: - Add extra functionalities
    /***************************************************************/
    
    
    
    
}


