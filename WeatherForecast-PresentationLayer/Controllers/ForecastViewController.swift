//
//  ForecastViewController.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class ForecastViewController : BaseViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var fiveDayForecastModel:ForecastWeatherModel!
    
    var getLocation = GetLocation()
    
    override func viewDidLoad() {
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getForecastData()
        self.didReloadData()
    }
}


extension ForecastViewController : UICollectionViewDelegate {
    
    struct StoryBoard
    {
        static let forecastCell = "forecastCell"
        static let sectionHeaderView = "SectionHeaderView"
    }
    
    func getForecastData() {
        self.getLocation.run {
            if let location = $0 {
                self.getWeatherInfo(_lat: location.coordinate.latitude, _lon: location.coordinate.longitude)
            } else {
                print("Get Location failed \(self.getLocation.didFailWithError)")
            }
        }
    }
    
    
    // section header view
    // DISABLED AT THIS MOMENT
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryBoard.sectionHeaderView, for: indexPath) as!
        SectionHeaderView
        
        if(fiveDayForecastModel != nil) {
            sectionHeaderView.categoryLabelTitle.text = fiveDayForecastModel.list[indexPath.section].dt.toString().description
        }
      
        return sectionHeaderView
    }
    
    func getWeatherInfo(_lat:Double, _lon:Double) {
        let service = FiveDayWeatherService()
        self.fiveDayForecastModel = service.getYourWeatherInfoDependingOnYourLocation(lat: String(_lat), lon: String(_lon))
    }
    
    func didReloadData(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(fiveDayForecastModel != nil){
            return fiveDayForecastModel.list.count
        }
        
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.forecastCell, for: indexPath) as! ForecastCell
        let current = fiveDayForecastModel.list[indexPath.row];

        
        if(current != nil) {
            
            cell.loadData(weatherInfo: current)
        }
        
        return cell
    }
}
