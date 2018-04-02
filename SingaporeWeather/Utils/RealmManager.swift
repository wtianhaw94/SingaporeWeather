//
//  WebService.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 3/28/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    var uiRealm = try! Realm()
    
    func getWeatherData() -> Weather {
        //Generate Data
        var myWeather = Weather()
        let queryWeather = try uiRealm.objects(Weather.self)
        
        if queryWeather.count > 0{
//            print(myWeather)
            myWeather = queryWeather.first!
            print("myWeather: ",myWeather)
        }
        return myWeather
    }
    
    func objectExist (id: Int) -> Bool {
        return uiRealm.object(ofType: Weather.self, forPrimaryKey: id) != nil
    }
    
}
