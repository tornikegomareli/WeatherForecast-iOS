//
//  TodayWeatherModel.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

struct TodayWeatherModel: Codable {
    let coord: Coordinate
    let weather: [WeatherInfo]
    let base: String
    let main: WeatherDetail
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}
