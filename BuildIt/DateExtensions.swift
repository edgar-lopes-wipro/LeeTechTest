//
//  NSDateExtensions.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

extension Date {
    var queryDate: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyy"
            return formatter.string(from: self)
        }
    }
    
    var dayAndTimeString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, h:mm a"
            return formatter.string(from: self)
        }
    }
    
}
