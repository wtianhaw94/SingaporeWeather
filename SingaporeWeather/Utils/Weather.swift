//
//  WeatherJson.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 3/28/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

// Define your models like regular Swift classes
class Weather: Object {
    @objc dynamic var id = 0
    @objc dynamic var query: Query?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Query: Object {
    @objc dynamic var count = 0
    @objc dynamic var created = ""
    @objc dynamic var lang = ""
    @objc dynamic var results: Results?
}

class Results: Object {
    @objc dynamic var channel: Channel?
}

class Channel: Object {
    @objc dynamic var units: Units?
    @objc dynamic var title = ""
    @objc dynamic var link = ""
//    @objc dynamic var description = ""
    @objc dynamic var language = ""
    @objc dynamic var lastBuildDate = ""
    @objc dynamic var ttl = ""
    @objc dynamic var location: Location?
    @objc dynamic var wind: Wind?
    @objc dynamic var atmosphere: Atmosphere?
    @objc dynamic var astronomy: Astronomy?
    @objc dynamic var image: Image?
    @objc dynamic var item: Item?
}

class Astronomy: Object {
    @objc dynamic var sunrise = ""
    @objc dynamic var sunset = ""
}

class Atmosphere: Object {
    @objc dynamic var humidity = ""
    @objc dynamic var pressure = ""
    @objc dynamic var rising = ""
    @objc dynamic var visibility = ""
}

class Image: Object {
    @objc dynamic var title = ""
    @objc dynamic var width = ""
    @objc dynamic var height = ""
    @objc dynamic var link = ""
    @objc dynamic var url = ""
}

class Item: Object {
    @objc dynamic var condition: Condition?
    let forecast = List<Forecast>()
//    @objc dynamic var description = ""
    @objc dynamic var guid: GUID?
    @objc dynamic var title = ""
    @objc dynamic var lat = ""
    @objc dynamic var long = ""
    @objc dynamic var link = ""
    @objc dynamic var pubDate = ""
}

class Condition: Object {
    @objc dynamic var code = ""
    @objc dynamic var date = ""
    @objc dynamic var temp = ""
    @objc dynamic var text = ""
}

class Forecast: Object {
    @objc dynamic var code = ""
    @objc dynamic var date = ""
    @objc dynamic var day = ""
    @objc dynamic var high = ""
    @objc dynamic var low = ""
    @objc dynamic var text = ""
}

class GUID: Object {
    @objc dynamic var isPermaLink = ""
}

class Location: Object {
    @objc dynamic var city = ""
    @objc dynamic var country = ""
    @objc dynamic var region = ""
}

class Units: Object {
    @objc dynamic var distance = ""
    @objc dynamic var pressure = ""
    @objc dynamic var speed = ""
    @objc dynamic var temperature = ""
}

class Wind: Object {
    @objc dynamic var chill = ""
    @objc dynamic var direction = ""
    @objc dynamic var speed = ""
}


