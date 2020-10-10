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
    
    var body: some View {
        Column {
            Column(spacing: 36) {
                VTBSlider(title: "Первоначальный взнос", prefix: "₽", maxValue: 7_000_000)
                VTBSlider(title: "Первоначальный взнос", prefix: "₽", maxValue: 7_000_000)
                VTBSlider(title: "Срок кредита", prefix: "₽", maxValue: 7_000_000)
            }
            .padding(.horizontal, 16)
            Row {
                Text("Получите персональное предложение от ВТБ")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Отправить заявку")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                })
                .frame(width: 140, height: 40)
                .background(Color.blue)
                .cornerRadius(7)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 559)
        .background(Color(#colorLiteral(red: 0.1875175834, green: 0.2722267807, blue: 0.3311970234, alpha: 1)))
        .cornerRadius(8)
        .padding(16)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard()
    }
}

struct VTBSlider: View {
    
    var title: String
    var prefix: String
    var maxValue: CGFloat
    private let sliderSize: CGFloat = 25
    
    
    @State var sliderWidth: CGFloat = 0
    
    
    var body: some View {
        Stack {
            GeometryReader { geometry in
                let maxWidth = geometry.size.width - sliderSize
                Column(alignment: .leading, spacing: 0) {
                    Text(title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.bottom, 20)
                    Stack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 4)
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 6.56245611e-05, green: 0.6601959467, blue: 0.9915047288, alpha: 1)))
                            .frame(width: sliderWidth, height: 4)
                        Circle()
                            .frame(width: sliderSize)
                            .foregroundColor(Color(#colorLiteral(red: 6.56245611e-05, green: 0.6601959467, blue: 0.9915047288, alpha: 1)))
                            .offset(x: sliderWidth)
                            .gesture(
                                DragGesture()
                                    .onChanged({ (value) in
                                        print(geometry.size.height)
                                        if value.location.x < 0 {
                                            sliderWidth = 0
                                            return
                                        }
                                        if value.location.x > maxWidth {
                                            sliderWidth = maxWidth
                                            return
                                        }
                                        
                                        if value.location.x > 0 || value.location.x < maxWidth {
                                            sliderWidth = value.location.x
                                        }
                                    })
                            )
                    }
                    .frame(height: 25)
                    Text("\(Int(sliderWidth / maxWidth * maxValue).formattedWithSeparator) \(prefix)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 6.56245611e-05, green: 0.6601959467, blue: 0.9915047288, alpha: 1)))
                        .font(.system(size: 18))
                        .padding(.top, 10)
                }
            }
        }
        .frame(height: 98)
    }
}

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
