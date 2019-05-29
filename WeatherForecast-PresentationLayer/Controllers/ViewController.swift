//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

class ViewController: BaseViewController, CLLocationManagerDelegate {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherCelsiusAndInfoLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherMainIconImage: UIImageView!
    @IBOutlet weak var tempMaxLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var humadityLbl: UILabel!
    
    let locationManager = CLLocationManager()
    var todayWeatherModel:TodayWeatherModel!
    let getLocation = GetLocation()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        getLocation.run {
            if let location = $0 {
                
                
                
                self.getWeatherInfo(_lat: location.coordinate.latitude, _lon: location.coordinate.longitude)
                self.dataDidLoad()
                self.getMainIcon()
                
                
                print("location = \(location)")
            } else {
                print("Get Location failed \(self.getLocation.didFailWithError)")
            }
        }
        
    }
}

extension ViewController {
    func getWeatherInfo(_lat:Double, _lon:Double) {
        let service = CurrentWeatherService()
        self.todayWeatherModel = service.getCurrentWeatherInformation(lat: String(_lat), lon: String(_lon))
    }
    
    func getMainIcon() {
        let iconService = WeatherIconGeneratorService()
        let icon = todayWeatherModel.weather.first?.icon
        let iconUrl = iconService.generateBaseUrl(iconName: icon!.rawValue)
        self.weatherMainIconImage.image(fromUrl: iconUrl)
    }
    
    func dataDidLoad() {
        
        cityNameLabel.text = todayWeatherModel.name
        
        let unwrapedDescription = (todayWeatherModel.weather.first?.weatherDescription)!
        weatherCelsiusAndInfoLabel.text = "\(todayWeatherModel.main.temp)° C | \(String(describing: unwrapedDescription))"
        
        humadityLbl.text = todayWeatherModel.main.humidity.toString() + " %"
        tempMaxLbl.text =  todayWeatherModel.main.tempMax.toString() + "° C"
        tempMinLbl.text =  todayWeatherModel.main.tempMin.toString() + "° C"
        pressureLbl.text = todayWeatherModel.main.pressure.toString()
        windSpeedLbl.text = todayWeatherModel.wind.speed.toString() + " k/h"
        
    }
}
