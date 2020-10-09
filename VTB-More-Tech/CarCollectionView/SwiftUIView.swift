//
//  SwiftUIView.swift
//  VTB-More-Tech
//
//  Created by Игорь Силаев on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach (0 ..< 3) { _ in
                    CarCollectionView()
                }
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
