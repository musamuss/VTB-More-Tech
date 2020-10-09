//
//  CarCollectionView.swift
//  VTB-More-Tech
//
//  Created by Игорь Силаев on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct CarCollectionView: View {
    var body: some View {
        ZStack {
            Image("bmw")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            VStack (alignment: .leading) {
                Text("РОЛЬФ (Москва)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                Text("ОФИЦИАЛЬНЫЙ ДИЛЕР")
                    .font(.system(size: 6, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                Text("BMW 3")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                Text("1 000 000 ₽")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 115, alignment: .leading)
        }
        .frame(width: 217, height: 151)
    }
}

struct CarCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarCollectionView()
    }
}
