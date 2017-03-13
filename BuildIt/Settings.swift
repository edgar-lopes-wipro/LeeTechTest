//
//  Settings.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

class Settings: NSObject {
    //This util class could write to some persistent store if given more time
    static var defaultCountryCode: String {
        get {
            return "IE"
        }
    }
    
    static var defaultCityName: String {
        get {
            return "Dublin"
        }
    }
    
}
