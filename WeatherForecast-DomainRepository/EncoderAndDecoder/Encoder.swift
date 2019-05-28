//
//  Encoder.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

class Encoder {
    private init() {}
    static let shared = Encoder()
    
    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        return encoder
    }
}
