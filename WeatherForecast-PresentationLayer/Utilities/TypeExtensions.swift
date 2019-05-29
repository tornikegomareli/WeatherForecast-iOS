//
//  TypeExtensions.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

extension Int : ToStringProtocol{
    func toString() -> String {
        return String(self).description
    }
}

extension Double: ToStringProtocol {
    func toString() -> String {
        return String(self).description
    }
}

extension Float: ToStringProtocol {
    func toString() -> String {
        return String(self).description
    }
}
