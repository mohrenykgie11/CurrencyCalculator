//
//  Currency.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit
import RealmSwift

struct Currency {
    var symbol : String
    
    init(symbol: String) {
        self.symbol = symbol
    }
}
