//
//  Location.swift
//  RainOrShine
//
//  Created by Eric Sirinian on 1/11/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    private init () {}
    
    var lat: Double!
    var long: Double!
    
}
