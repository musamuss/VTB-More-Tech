//
//  MainView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            CardViewPreview().frame(height: 281)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach (0 ..< 3) { _ in
                        Spacer()
                        CarCollectionView()
                    }
                }
            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
