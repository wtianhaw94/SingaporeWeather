//
//  DetailWeatherViewController.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 4/2/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import Foundation
import UIKit

class DetailWeatherViewController : UIViewController {
    
    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var lbl_highTem: UILabel!
    @IBOutlet weak var lbl_lowTemp: UILabel!
    @IBOutlet weak var lbl_text: UILabel!
    @IBOutlet weak var img_forecast: UIImageView!
    
    var forecast = Forecast()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_date.text = "\(forecast.date), \(forecast.day)"
        lbl_text.text = "\(forecast.text)"
        lbl_highTem.text = "\(forecast.high)'"
        lbl_lowTemp.text = "\(forecast.low)'"
        
        switch forecast.code {
        case "4":
            img_forecast.image = #imageLiteral(resourceName: "Thunderstorms")
        case "28":
            img_forecast.image = #imageLiteral(resourceName: "Mostly Cloudy")
        case "47":
            img_forecast.image = #imageLiteral(resourceName: "Scattered Thunderstorms")
        default:
            img_forecast.image = #imageLiteral(resourceName: "NA Weather")
        }
    }
}
