//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/28/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var service = FiveDayWeatherService()
        
        
        var data = service.makeRequest(lat: "35", lon: "139")
        
        print(data)
    }


}

