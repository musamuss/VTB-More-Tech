//
//  CreditCard.swift
//  VTB-More-Tech
//
//  Created by Vasiliy Dmitriev on 10/9/20.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct CreditCard: View {
    
    var body: some View {
        Column(spacing: 0) {
            Column(alignment: .leading, spacing: 8) {
                Row {
                    Text("Ежемесячный платеж от")
                        .font(.system(size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.6626856923, green: 0.6627831459, blue: 0.6626644135, alpha: 1)))
                    Spacer()
                    Image("vtb_logo")
                        .aspectRatio(contentMode: .fit)
                }
                Text("6 990 000 ₽ / месяц")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 16)
            Column(spacing: 36) {
                VTBSlider(title: "Первоначальный взнос", prefix: "₽", maxValue: 7_000_000)
                VTBSlider(title: "Сумма кредита", prefix: "₽", maxValue: 7_000_000)
            }
            .padding(.horizontal, 16)
            Spacer()
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
                .background(Color(#colorLiteral(red: 0.001224983018, green: 0.668161869, blue: 0.9994378686, alpha: 1)))
                .cornerRadius(7)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 26)
        }
        .frame(height: 430)
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
