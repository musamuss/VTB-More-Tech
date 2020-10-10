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

extension Gradient {
    static var vtbGradient: LinearGradient {
        let colors = Gradient(colors: [Color(#colorLiteral(red: 0.07058823529, green: 0.5607843137, blue: 0.9176470588, alpha: 1)),Color(#colorLiteral(red: 0.1294117647, green: 0.2980392157, blue: 0.4156862745, alpha: 1)), Color(#colorLiteral(red: 0.0862745098, green: 0.1764705882, blue: 0.2392156863, alpha: 1))])
        return LinearGradient(gradient: colors, startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
    }
}
