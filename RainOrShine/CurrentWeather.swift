//
//  CurrentWeather.swift
//  RainOrShine
//
//  Created by Eric Sirinian on 1/11/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _description: String!
    private var _currentTemp: String!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        
        _date = "Today, \(currentDate)"
        
        return _date
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: _currentWeatherURL)
        
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._description = main.capitalized
                        print(self._description)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        let kelvinToFarenheitPreDivision = (temp * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        self._currentTemp = "\(kelvinToFarenheit)°"
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
        
        
    }
    
}
























