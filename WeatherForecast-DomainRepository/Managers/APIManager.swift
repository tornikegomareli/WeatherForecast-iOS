//
//  APIManager.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation


struct APIManager {
    struct WeatherAPI
    {
        static let ForecastEndPoint:String = "https://api.openweathermap.org/data/2.5/forecast?"
        static let CurrentWeatherEndPoint:String  = "https://api.openweathermap.org/data/2.5/weather?"
        static let API_KEY:String = "4b22875f640574a14f703820b61d488c"
    }
    
    struct WeatherApiIcon
    {
        static let baseEndPointForIcon:String = "http://openweathermap.org/img/w/"
    }
}
