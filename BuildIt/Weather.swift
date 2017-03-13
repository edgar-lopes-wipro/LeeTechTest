//
//  Weather.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

struct Weather {
    
    enum skyType {
        case clear
        case cloudy
        case rain
        case unknown
    }
    
    var description: String! = ""
    var sky: skyType!

    
    init(_ data: [String : AnyHashable]) {
        
        if let desc = data["description"] as? String {
            description = desc
        }
        
        if let main = data["main"] as? String {
            switch main {
                case "Rain": sky = .rain
                    break
                case "Clear": sky = .clear
                    break
                case "Clouds": sky = .cloudy
                    break
                default: sky = .unknown
                    break
            }
        }
    }
}
