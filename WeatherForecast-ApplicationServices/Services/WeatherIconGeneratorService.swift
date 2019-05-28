//
//  WeatherIconGeneratorService.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation


class WeatherIconGeneratorService {
    
    public func generateBaseUrl(iconName:String) -> String{
         return APIManager.WeatherApiIcon.baseEndPointForIcon + iconName + ".png"
    }
}
