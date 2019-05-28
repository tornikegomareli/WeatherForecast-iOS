//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherCelsiusAndInfoLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherMainIconImage: UIImageView!
    
    var locationManager:CLLocationManager!
    var todayWeatherModel:CurrentWeatherModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initUserData()
        
       self.getWeatherInfo(_lat: (locationManager.location?.coordinate.latitude)!,_lon: (locationManager.location?.coordinate.longitude)!)
       self.getMainIcon()
       self.setLabels()
    }
    
    fileprivate func initUserData() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
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
    
    func setLabels() {
        cityNameLabel.text = todayWeatherModel.name
        weatherCelsiusAndInfoLabel.text = "\(todayWeatherModel.main.temp)*C | \(todayWeatherModel.weather.first?.weatherDescription)"

    }
}
