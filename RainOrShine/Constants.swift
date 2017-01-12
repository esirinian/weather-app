//
//  Constants.swift
//  RainOrShine
//
//  Created by Eric Sirinian on 1/11/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LONG = "&lon="
let APP_ID = "&appid="
let API_KEY = "25fc0f86e5c98ca5854a4fba74b8839f"

let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let FORECAST_COUNT_MODE = "&cnt=10&mode=json"

typealias DownloadComplete = () -> ()

let _currentWeatherURL = "\(BASE_URL)\(LAT)\(Location.sharedInstance.lat!)\(LONG)\(Location.sharedInstance.long!)\(APP_ID)\(API_KEY)"
let _forecastURL = "\(FORECAST_BASE_URL)\(LAT)\(Location.sharedInstance.lat!)\(LONG)\(Location.sharedInstance.long!)\(FORECAST_COUNT_MODE)\(APP_ID)\(API_KEY)"
