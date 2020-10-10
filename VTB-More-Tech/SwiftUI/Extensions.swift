//
//  Extensions.swift
//  VTB-More-Tech
//
//  Created by Vasiliy Dmitriev on 10/10/20.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI
import Foundation

typealias Stack = ZStack
typealias Column = VStack
typealias Row = HStack


extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
