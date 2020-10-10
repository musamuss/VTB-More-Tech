//
//  CameraView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        ZStack {
            CameraPreview()
            VStack {
                Text("Сфотографируйте машину")
                Spacer()
                Button(action: {
                    print("Чпок")
                }, label: {
                    Text("Чпок")
                })
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
