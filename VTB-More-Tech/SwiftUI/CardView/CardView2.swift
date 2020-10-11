//
//  TestView.swift
//  VTB-More-Tech
//
//  Created by admin on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire

struct CardView2: View {
    
    @Binding var carInfo: CarInfo?
    @Binding var hero: Bool
    @State var carImage: Image = Image("vtb_logo")
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            VStack(alignment: .leading) {
                
                carImage
                    .resizable()
                    .frame(height: self.hero ? 300 : 250)
                    .cornerRadius(self.hero ? 0 : 25)
                
                
                if self.hero {
                    
                    HStack{
                        
                        Text(("\(carInfo?.car.title ?? "") \(carInfo?.choosedModel.model?.titleRus ?? "")"))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Row {
                        Image("stars")
                            .padding(.leading, 16)
                        Spacer()
                        Text("Цена: \((self.carInfo?.choosedModel.minprice?.price)!)")
                            .padding(.horizontal)
                            .foregroundColor(Color.white)
                    }
                    
                    HStack{
                        Text("Details")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.leading, 16)
                        
                        Spacer()
                    }
                    Row {
                        Column(alignment: .leading, spacing: 8) {
                            Text("Страна: \(self.carInfo?.car.country?.title ?? "")")
                                .foregroundColor(Color.white)
                            Text("Кузов: \(self.carInfo?.choosedModel.bodies?.first?.title ?? "")")
                                .foregroundColor(Color.white)
                            Text("Производитель: \(self.carInfo?.choosedModel.brand?.title ?? "")")
                                .foregroundColor(Color.white)
                            Text("Класс: \(carInfo?.choosedModel.transportType?.title ?? "")")
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 16)
                        Spacer()
                    }
                    Text("Похожее")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.top, 16)
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (0 ..< 3) { _ in
                                Spacer(minLength: 16)
                                CarCollectionView()
                            }
                        }
                    }
                    
                }
            }
            .padding(.horizontal, self.hero ? 0 : 16)
            // to ignore spacer scroll....
            .contentShape(Rectangle())
            
            // showing only when its expanded...
            
            if self.hero {
                
                Button(action: {
                    
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        self.hero.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .clipShape(Circle())
                    
                }
                .padding(.top,84)
                .padding(.trailing,10)
            }
        }
        .onAppear() {
            AF.request((carInfo?.choosedModel.photo)!,method: .get).response { response in
                
                switch response.result {
                case .success(let responseData):
                    let image = UIImage(data: responseData!, scale:1)
                    self.carImage = Image(uiImage: image!)
                    
                case .failure(let error):
                    print("error--->",error)
                }
            }
        }
    }
}
