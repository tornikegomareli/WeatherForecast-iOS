//
//  CurrentWeatherModel.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

struct CurrentWeatherModel : Codable {
        let coord: Coordinate
        let weather: [WeatherInfo]
        let main: WeatherDetail
        let wind: Wind
        let rain: Rain
        let clouds: Clouds
        let dt, id: Int
        let name: String
        let cod: Int
}
