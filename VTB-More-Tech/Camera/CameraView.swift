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
    @State var mainNeedPresented = false
    @State var alertNeedPresented = false
    
    @State var needPhoto: Bool = false
    @State var photo: UIImage? = nil
    
    @State var carInfo: CarInfo? = nil
    
    @State var apiRequest: AnyCancellable? = nil
    @State var apiRequestLoading: Bool = false
    
    var body: some View {
        ZStack {
            CameraPreview(needPhoto: $needPhoto, photo: $photo) { photo in
                self.apiRequest = API.current.carModelName(from: photo)
                    .flatMap({ propabilities -> Future<CarInfo, APIError> in
                        let model = propabilities
                            .max { a, b in a.value < b.value }!
                            .key
                        
                        return API.current.carInfo(for: model)
                    })
                    .sink(receiveCompletion: { error in
                        print(error)
                        self.apiRequestLoading = false
                        self.alertNeedPresented = error != .finished
                    }, receiveValue: { carInfo in
                        self.carInfo = carInfo
                        self.mainNeedPresented = true
                        self.apiRequestLoading = false
                    })
            }.edgesIgnoringSafeArea(.vertical)
            VStack {
                Text("Сфотографируйте машину")
                    .padding(.top, 24)
                    .font(.headline)
                Spacer()
                CameraProgress(isLoading: $apiRequestLoading)
                Spacer()
                Button(action: {
                    self.needPhoto = true
                    self.apiRequestLoading = true
                },
                label: {
                    Image(systemName: "camera.fill")
                        .font(Font.system(.largeTitle))
                })
                .padding(.bottom, 24)
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6666666667, blue: 1, alpha: 1)))
            }
        }
        .sheet(isPresented: $mainNeedPresented) {
            MainView(carInfo: $carInfo)
        }
        .alert(isPresented: $alertNeedPresented) {
            Alert(title: Text("Не удалось распознать машину 🥺"))
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
