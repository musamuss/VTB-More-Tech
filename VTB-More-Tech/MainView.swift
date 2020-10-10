//
//  MainView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Binding var carInfo: CarInfo?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Column(alignment: .leading) {
                CardViewPreview(carInfo: $carInfo)
                    .frame(height: 281)
                    .padding(16)
                Text("Рекомендации")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0 ..< 3) { _ in
                            Spacer(minLength: 16)
                            CarCollectionView()
                        }
                    }
                }
                Text("Купить в кредит")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                
                CreditCard(firstValue: 0, secondValue: 0)
            }
        }
        .background(Gradient.vtbGradient)
        .edgesIgnoringSafeArea(.bottom)
    }
}
