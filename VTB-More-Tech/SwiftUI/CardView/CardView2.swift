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
            
            VStack {
                
                carImage
                    .resizable()
                    .frame(height: self.hero ? 250 : 200)
                    .cornerRadius(self.hero ? 0 : 25)
                
                
                if self.hero {
                    
                    HStack{
                        
                        Text(("\(carInfo?.car.title ?? "") \(carInfo?.choosedModel.model?.titleRus ?? "")"))
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text((self.carInfo?.car.alias)!)
                        .padding(.horizontal)
                    
                    HStack{
                        
                        Text("Details")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
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
                .padding(.top,48)
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
