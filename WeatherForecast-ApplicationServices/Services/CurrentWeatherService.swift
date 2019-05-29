//
//  CurrentWeatherService.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation

class CurrentWeatherService : CurrentWeatherInfoServiceProtol {
    func getCurrentWeatherInformation(lat: String, lon: String) -> TodayWeatherModel {
        let baseUrl = generateBaseUrl(latitude: lat, longtitude: lon)
        
        let networkManager = NetworkManager.shared(url: baseUrl)
        
        let data:TodayWeatherModel = networkManager
            .request()
        
        return data
    }
    
    private func generateBaseUrl(latitude:String, longtitude:String) -> String {
        return APIManager.WeatherAPI.CurrentWeatherEndPoint + "lat=\(latitude)&lon=\(longtitude)&appid=\(APIManager.WeatherAPI.API_KEY)&units=metric"
    }
}
