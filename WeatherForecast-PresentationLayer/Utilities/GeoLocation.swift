//
//  GeoLocation.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation


import CoreLocation

public class GetLocation: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var locationCallback: ((CLLocation?) -> Void)!
    var locationServicesEnabled = false
    var didFailWithError: Error?
    
    public func run(callback: @escaping (CLLocation?) -> Void) {
        locationCallback = callback
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        locationServicesEnabled = CLLocationManager.locationServicesEnabled()
        if locationServicesEnabled { manager.startUpdatingLocation() }
        else { locationCallback(nil) }
    }
    
    public func locationManager(_ manager: CLLocationManager,
                                didUpdateLocations locations: [CLLocation]) {
        locationCallback(locations.last!)
        manager.stopUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        didFailWithError = error
        locationCallback(nil)
        manager.stopUpdatingLocation()
    }
    
    deinit {
        manager.stopUpdatingLocation()
    }
}
