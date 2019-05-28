//
//  GetFiveDayWeatherService.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

class FiveDayWeatherService : BaseWeatherServiceReqeustProtocol {
    
    public func GetFiveDayWeather(_lat:String, _lon:String) -> WeatherModel
    {
        return makeRequest(lat: _lat, lon: _lon)
    }
    
    internal func makeRequest(lat: String, lon: String) -> WeatherModel {
        let endPoint = APIManager.WeatherAPI.BaseEndPoint
        let baseUrl = endPoint + "lat=\(lat)&lon=\(lon)&appid=\(APIManager.WeatherAPI.API_KEY)"
        
        let networkManager = NetworkManager.shared(url: baseUrl)
        
        let data:WeatherModel = networkManager
            .request()
        
        return data
    }
}
