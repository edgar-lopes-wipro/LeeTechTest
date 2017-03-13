//
//  Forcast.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

struct Forcast {

    var date: Date?
    var weather: Weather?
    var main: WeatherMain?

    init(_ data: [String : AnyHashable]) {
        
        if let weatherDataArray = data["weather"] as? [[String : AnyHashable]?] {
            if let weatherData = weatherDataArray.first {
                weather = Weather(weatherData!)
            }
        }
        
        if let weatherMain = data["main"] as? [String : AnyHashable] {
            main = WeatherMain(weatherMain)
        }
        
        if let timeInterval = data["dt"] as? Double {
            date = Date(timeIntervalSince1970: timeInterval)
        }
        
    }
    
}
