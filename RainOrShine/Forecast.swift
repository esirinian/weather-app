//
//  Forecast.swift
//  RainOrShine
//
//  Created by Eric Sirinian on 1/11/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    private var _date: String!
    private var _description: String!
    private var _hiTemp: String!
    private var _loTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var hiTemp: String {
        if _hiTemp == nil {
            _hiTemp = ""
        }
        return _hiTemp
    }
    
    var loTemp: String {
        if _loTemp == nil {
            _loTemp = ""
        }
        
        return _loTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._loTemp = "\(kelvinToFarenheit)°"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._hiTemp = "\(kelvinToFarenheit)°"
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._description = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
        
        
    }
    
}



extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: self)
    }
}





