//
//  MainView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Binding var carInfo: CarInfo?
    @State var presentingModal = false
    @State var hero = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Column(alignment: .leading) {
                Spacer()
                Stack {
                    GeometryReader { g in
                        CardView2(carInfo: $carInfo, hero: self.$hero)
                            
                            // going to move view up how its down from top...
                            .offset(y: hero ? -g.frame(in: .global).minY : 0)
                            
                            // going to hide all other views when a view is expanded...
                            .opacity(self.hero ? (hero ? 1 : 0) : 1)
                            // you can see still scrollview is working so were going to disable it...
                            // follow me...
                            
                            .onTapGesture {
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    self.hero.toggle()
                                }
                                
                            }
                        
                    }
                    // going to increase height based on expand...
                    .frame(height: hero ? UIScreen.main.bounds.height : 200)
                    
                    // 500 for disabling the drag for scrollview...
                    .simultaneousGesture(DragGesture(minimumDistance: hero ? 0 : 500).onChanged({ (_) in
                        //скрывать карточку при жесте вниз
                        //                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        //                                self.hero.toggle()
                        //                        }
                    }))
                    
                    if !hero {
                        CardViewPreview(carInfo: $carInfo)
                            .frame(height: 64)
                            .padding(.horizontal, 16)
                            .offset(y: 130)
                    }
                    
                }
                
                
                Text("Рекомендации")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                    .padding(.top,74)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0 ..< 3) { _ in
                            Spacer(minLength: 16)
                            CarCollectionView()
                        }
                    }
                }
                Text("Купить в кредит")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                
                CreditCard(firstValue: 0, secondValue: 0)
            }
        }
        .background(Gradient.vtbGradient)
        .edgesIgnoringSafeArea(.bottom)
    }
}
