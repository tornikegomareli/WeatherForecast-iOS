//
//  WeatherServiceProtocol.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

protocol FiveDayWeatherServiceReqeustProtocol {
    func GetFiveDayWeatherService(lat:String,lon:String) -> BasicWeatherModel
}
