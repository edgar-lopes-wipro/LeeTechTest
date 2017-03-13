//
//  WeatherResponse.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

struct WeatherResponse {

    var forcasts: [Forcast] = []
    
    init(_ data: [String : AnyHashable]) {
        if let forcastData = data["list"] as? [[String : AnyHashable]] {
            for f in forcastData {
                let forcast = Forcast.init(f)
                forcasts.append(forcast)
            }
        }
    }
    
}

extension WeatherResponse {
    /*
     * Gets todays forcast
     */
    func currentForcast() -> Forcast? {
        let date = Date().queryDate
        guard let today = forcasts.filter({$0.date!.queryDate == Date().queryDate}).first else {
            return nil
        }
        return today
    }
    
    /*
     * Gets a forcast for next 4 days from today
     */
    func futureForcasts() -> [Forcast] {
        //lets just assume anything that is not today is the future
        return forcasts.filter({$0.date!.queryDate != Date().queryDate})
    }
    
    //if i had more time i would like to create a fuction that aggregates the forcasts by day
    
}
