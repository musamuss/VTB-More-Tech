//
//  VTBSlider.swift
//  VTB-More-Tech
//
//  Created by Vasiliy Dmitriev on 10/10/20.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct VTBSlider: View {
    @Binding var currenValue: Int
    
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
                                            currenValue = Int(sliderWidth / maxWidth * maxValue)
                                        }
                                    })
                            )
                    }
                    .frame(height: 25)
                    Row {
                        Text("\(Int(sliderWidth / maxWidth * maxValue).formattedWithSeparator) \(prefix)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 6.56245611e-05, green: 0.6601959467, blue: 0.9915047288, alpha: 1)))
                            .font(.system(size: 18))
                        Spacer()
                        Text("\( Int(sliderWidth / maxWidth * 100) ) %")
                            .foregroundColor(Color(#colorLiteral(red: 0.6008395553, green: 0.6197888851, blue: 0.662752986, alpha: 1)))
                            .font(.system(size: 18))
                    }
                    .padding(.top, 10)
                }
            }
        }
        .frame(height: 98)
    }
    
}

//struct VTBSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        VTBSlider(currenValue: 0, title: "Первоначальный взнос", prefix: "₽", maxValue: 7_000_000)
//    }
//}
