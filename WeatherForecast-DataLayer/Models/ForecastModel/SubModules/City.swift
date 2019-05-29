//
//  City.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coordinate
    let country: String
}
