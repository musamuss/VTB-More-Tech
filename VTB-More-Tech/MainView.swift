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
        VStack (alignment: .leading, spacing: 0.0) {
            CardViewPreview(carInfo: $carInfo)
                .frame(height: 281)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            Text("Рекомендации")
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.top, 38)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach (0 ..< 3) { _ in
                        Spacer(minLength: 16)
                        CarCollectionView()
                    }
                }
            }
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.0862745098, green: 0.1764705882, blue: 0.2392156863, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
    }
}
