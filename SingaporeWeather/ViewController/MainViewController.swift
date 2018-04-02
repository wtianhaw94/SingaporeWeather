//
//  MainViewController.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 3/28/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weather App"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "offlineSegue" {
            let destinationVC = segue.destination as! WeatherViewController
            destinationVC.offLineMode = true
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "offlineSegue" {
            if !realmManager.objectExist(id: 0){
                
                let alert = UIAlertController(title: "Data is empty", message: "Please select real time to save the data.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                return false
            }
        }
        
        // by default, transition
        return true
    }
}
