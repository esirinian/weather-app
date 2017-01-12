//
//  WeatherCell.swift
//  RainOrShine
//
//  Created by Eric Sirinian on 1/11/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var loLabel: UILabel!
    
    func updateCell(forecast: Forecast) {
        loLabel.text = forecast.loTemp
        hiLabel.text = forecast.hiTemp
        descriptionLabel.text = forecast.description
        weatherImage.image = UIImage(named: forecast.description)
        dayLabel.text = forecast.date
    }
    
    

}
