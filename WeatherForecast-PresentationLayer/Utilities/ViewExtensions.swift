//
//  ViewExtensions.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func image(fromUrl urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Couldn't create URL from \(urlString)")
            return
        }
        let theTask = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: response)
                }
            }
        }
        theTask.resume()
    }
}

extension UIColor{
    class func acidGreenColor ( alpha: CGFloat = 1.0 ) -> UIColor {
        return  UIColor.init ( red: 176.0/255.0, green: 191.0/255.0, blue: 26.0/255.0, alpha: alpha ) }
}


