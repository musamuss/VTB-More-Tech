//
//  TestView.swift
//  VTB-More-Tech
//
//  Created by admin on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation
import SwiftUI
 
 // card View...
 
 struct CardView2 : View {
     
     @Binding var data : Card
     @Binding var hero : Bool
     
     var body: some View{
         
         
         // going to implement close button...
         
         ZStack(alignment: .topTrailing){
             
             VStack{
                 
                Image(self.data.image)
                    .resizable()
                    .frame(height: self.data.expand ? 250 : 200)
                    .cornerRadius(self.data.expand ? 0 : 25)
                    
                 
                 if self.data.expand{
                     
                     HStack{
                         
                         Text(self.data.title)
                             .font(.title)
                             .fontWeight(.bold)
                         
                         Spacer()
                     }
                     .padding()
                     
                     Text(self.data.details)
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
             .padding(.horizontal, self.data.expand ? 0 : 16)
             // to ignore spacer scroll....
             .contentShape(Rectangle())
             
             // showing only when its expanded...
             
             if self.data.expand{
                 
                 Button(action: {
                    
                     withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                         
                         self.data.expand.toggle()
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
     }
 }
 
 
 // sample Data..
 
 struct Card : Identifiable {
    //@Binding var cardInfo: CarInfo?
     var id : Int
     var image : String
     var title : String
     var details : String
     var expand : Bool
 }
