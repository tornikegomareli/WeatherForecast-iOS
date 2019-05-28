//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation


struct ForecastWeatherModel: Codable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [WeatherOfDay]
    let city: City
}
