//
//  CurrentWeatherServiceProtocol.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

protocol CurrentWeatherInfoServiceProtol {
    func getCurrentWeatherInformation(lat:String, lon:String) -> CurrentWeatherModel
}
