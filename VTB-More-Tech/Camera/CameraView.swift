//
//  CameraView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI
import Combine

struct CameraView: View {
    @State var isPresented = false
    @State var photo: UIImage? = nil
    @State var carInfo: CarInfo? = nil
    @State var apiRequest: AnyCancellable? = nil
    
    var body: some View {
        ZStack {
            CameraPreview(photo: $photo)
            VStack {
                Text("Сфотографируйте машину")
                Spacer()
                Button(action: {
                    self.apiRequest = API.current.carInfo(for: "Mazda 6")
                        .sink(receiveCompletion: { error in print(error) },
                              receiveValue: { carInfo in
                                self.carInfo = carInfo
                                self.isPresented = true
                              })
                    
                }, label: {
                    if photo != nil {
                        Text("Сфоткано")
                    } else {
                        Text("Чпок")
                    }
                })
            }
        }.sheet(isPresented: $isPresented, content: {
            MainView(carInfo: $carInfo)
        })
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
