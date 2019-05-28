//
//  Rain.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation


struct Rain: Codable {
    let the3H: Float
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
