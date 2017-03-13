//
//  Main.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

//I should spend some more time thinking of better names for the objects
struct WeatherMain {
    
    var minTemp: Double = 0.0
    var maxTemp: Double = 0.0
    var currentTemp: Double = 0.0

    init(_ data: [String : AnyHashable]) {
        if let min = data["temp_min"] as? Double {
            minTemp = min
        }
        
        if let max = data["temp_max"] as? Double {
            maxTemp = max
        }
        
        if let now = data["temp"] as? Double {
            currentTemp = now
        }
    }
}
