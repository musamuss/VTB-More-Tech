//
//  CreditCard.swift
//  VTB-More-Tech
//
//  Created by Vasiliy Dmitriev on 10/9/20.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

typealias Stack = ZStack
typealias Column = VStack
typealias Row = HStack

struct CreditCard: View {
    
    @State private var curVal: Double = 5
    
    var body: some View {
        Column {
            VTBSlider()
        }
        .background(Color(#colorLiteral(red: 0.1283607185, green: 0.2844539285, blue: 0.4022275805, alpha: 1)))
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard()
    }
}

struct VTBSlider: View {
    @State var sliderWidth: CGFloat = 0
    var body: some View {
        Stack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 4)
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 6.56245611e-05, green: 0.6601959467, blue: 0.9915047288, alpha: 1)))
                .frame(width: sliderWidth, height: 4)
            Stack() {
                Text("670 000 ₽")
                    .foregroundColor(.white)
                    .offset(x: sliderWidth, y: 26)
                Circle()
                    .frame(width: 25)
                    .foregroundColor(Color(#colorLiteral(red: 6.56245611e-05, green: 0.6601959467, blue: 0.9915047288, alpha: 1)))
                    .offset(x: sliderWidth)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                if value.location.x >= 0 && value.location.x <= UIScreen.main.bounds.width - 25 {
                                    sliderWidth = value.location.x
                                }
                            })
                    )
            }
            .frame(height: 100)
        }
    }
}
