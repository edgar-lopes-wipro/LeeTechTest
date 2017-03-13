//
//  BTError.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

struct BTError {
    enum errorType {
        case badRequest
        case parsingError
    }
    
    var errorType: errorType!
    var description: String!
    
    init(_ errorType: errorType, _ description: String? = "") {
        self.errorType = errorType
        self.description = description
    }
}
