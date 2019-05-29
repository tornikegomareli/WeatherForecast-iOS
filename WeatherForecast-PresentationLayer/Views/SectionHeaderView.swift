//
//  SectionHeaderView.swift
//  WeatherForecast
//
//  Created by Tornike Gomareli on 5/29/19.
//  Copyright © 2019 Tornike Gomareli. All rights reserved.
//

import Foundation
import UIKit

class SectionHeaderView : UICollectionReusableView {
    
    @IBOutlet weak var categoryLabelTitle: UILabel!
    var categoryTitle:String! {
        didSet {
            categoryLabelTitle.text = categoryTitle
        }
    }
}
