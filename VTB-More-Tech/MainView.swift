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
    
    @State var data = [Card(id: 0, image: "", title: "USA", details: "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean. Major Atlantic Coast cities are New York, a global finance and culture center, and capital Washington, DC. Midwestern metropolis Chicago is known for influential architecture and on the west coast, Los Angeles' Hollywood is famed for filmmaking.", expand: false)
    ]
    
    @State var hero = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Column(alignment: .leading) {
                Spacer()
                Stack {
                    GeometryReader{g in
                        CardView2(data: $data[0], hero: self.$hero)
                            
                            // going to move view up how its down from top...
                            .offset(y: self.data[0].expand ? -g.frame(in: .global).minY : 0)
                            
                            // going to hide all other views when a view is expanded...
                            .opacity(self.hero ? (self.data[0].expand ? 1 : 0) : 1)
                            // you can see still scrollview is working so were going to disable it...
                            // follow me...
                            
                            .onTapGesture {
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    
                                    if !self.data[0].expand{
                                        self.hero.toggle()
                                        // opening only one time then close button will work...
                                        
                                        self.data[0].expand.toggle()
                                    }
                                }
                                
                            }
                        
                    }
                    // going to increase height based on expand...
                    .frame(height: self.data[0].expand ? UIScreen.main.bounds.height : 200)
                    
                    // 500 for disabling the drag for scrollview...
                    .simultaneousGesture(DragGesture(minimumDistance: self.data[0].expand ? 0 : 500).onChanged({ (_) in
                        
                        print("dragging")
                    }))
                    
                    if !hero {
                            CardViewPreview(carInfo: $carInfo)
                                .frame(height: 64)
                                .padding(.horizontal, 16)
                                .offset(y: 110)
                    }

                }
                
                
                Text("Рекомендации")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                    .padding(.top,54)
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
