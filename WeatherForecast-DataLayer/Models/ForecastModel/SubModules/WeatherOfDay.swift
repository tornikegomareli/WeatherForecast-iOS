//
//  WeatherDetail.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation


struct WeatherOfDay: Codable {
    let dt: Int
    let main: WeatherDetail
    let weather: [WeatherInfo]
    let clouds: Clouds
    let wind: Wind
    let rain : Rain? // sometimes value is coming nil from the json
    let sys: Sys
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, rain, sys
        case dtTxt = "dt_txt"
    }
}
