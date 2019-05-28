//
//  GetFiveDayWeatherService.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

class FiveDayWeatherService : FiveDayWeatherServiceReqeustProtocol {
    func GetFiveDayWeatherService(lat: String, lon: String) -> BasicWeatherModel {
        
        let baseUrl = generateBaseUrl(latitude: lat, longtitude: lon)
        
        let networkManager = NetworkManager.shared(url: baseUrl)
        
        let data:BasicWeatherModel = networkManager
            .request()
        
        return data
    }
    
    private func generateBaseUrl(latitude:String, longtitude:String) -> String {
     return APIManager.WeatherAPI.BaseEndPoint + "lat=\(latitude)&lon=\(longtitude)&appid=\(APIManager.WeatherAPI.API_KEY)"
    }
}
