//
//  BaseViewController.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var grayView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func activityIndicatorBegin() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0,width: 50,height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        grayView = UIView()
        grayView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        grayView.backgroundColor = UIColor.black
        grayView.alpha = 0.5
        self.view.addSubview(grayView)
    }
    
    func activityIndicatorEnd() {
        self.activityIndicator.stopAnimating()
        self.grayView.removeFromSuperview()
    }}
