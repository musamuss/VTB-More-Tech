//
//  CameraView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            CameraPreview()
            VStack {
                Text("Сфотографируйте машину")
                Spacer()
                Button(action: {
                    print("Чпок")
                    isPresented = true
                }, label: {
                    Text("Чпок")
                })
            }
        }.sheet(isPresented: $isPresented, content: {
            MainView()
        })
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
