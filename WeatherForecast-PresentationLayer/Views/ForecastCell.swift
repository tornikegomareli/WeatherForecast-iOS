//
//  ForecastCell.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateTimeLbl: UILabel!
    @IBOutlet weak var weatherDescriptionLbl: UILabel!
    @IBOutlet weak var celsiusLbl: UILabel!
    
    
    public func loadData(weatherInfo:WeatherOfDay){
        var weatherService = WeatherIconGeneratorService()
        
        var iconUrl = weatherService.generateBaseUrl(iconName: (weatherInfo.weather.first?.icon)!.rawValue)
        
        weatherImageView.image(fromUrl: iconUrl)
        dateTimeLbl.text = weatherInfo.dtTxt
        weatherDescriptionLbl.text = (weatherInfo.weather.first?.weatherDescription).map { $0.rawValue }
        celsiusLbl.text = "\(weatherInfo.main.temp)° C"
    }
    
}
