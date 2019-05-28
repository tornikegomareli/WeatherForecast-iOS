//
//  Decoder.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

class Decoder {
    private init() {}
    
    static let shared = Decoder()
    
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}
