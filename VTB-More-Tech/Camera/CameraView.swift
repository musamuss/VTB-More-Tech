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
            Color(#colorLiteral(red: 0.0862745098, green: 0.1764705882, blue: 0.2392156863, alpha: 1))
                .edgesIgnoringSafeArea(.vertical)
            CameraPreview()
                VStack {
                    Text("Сфотографируйте машину")
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        print("Чпок")
                        self.isPresented.toggle()
                    }, label: {
                        Text("Чпок")
                    })
                }
            .sheet(isPresented: $isPresented, content: {
                MainView()
            })

        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
