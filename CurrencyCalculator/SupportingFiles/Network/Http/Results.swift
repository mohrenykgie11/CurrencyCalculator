//
//  Results.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit
import Foundation
import SwiftyJSON

enum Results<T> {
    case success(JSON)
    case failure(Error)
    
    func get() -> JSON{
        switch self{
        case .success(let data):
            return data
        default: return JSON([])
        }
    }
    
}

