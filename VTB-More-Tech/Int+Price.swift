//
//  Formatters.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 11.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

extension Int {
    var price: String {
        priceFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

fileprivate let priceFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.minimumFractionDigits = 0
    
    return formatter
}()
