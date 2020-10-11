//
//  FinishScreen.swift
//  VTB-More-Tech
//
//  Created by admin on 11.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct FinishScreen: View {
    var body: some View {
        Stack {
            
            Gradient.vtbGradient
                            .edgesIgnoringSafeArea(.all)
            Column {
                Spacer()
                Column {
                    Image("vtb_logo")
                        .padding(.top, 24)
                    
                    Text("Ваша заявка в ВТБ принята! Ожидайте звонка сотрудника Банка.")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .padding(.top,16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                }
                .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 0.1882352941, green: 0.2705882353, blue: 0.3333333333, alpha: 1)))
                .cornerRadius(30)
                Spacer()
                Button(action: {
                    UIApplication.shared.windows.first {$0.isKeyWindow}?.rootViewController?.dismiss(animated: true, completion: nil)
                }, label: {
                    Text("Закрыть")
                })
                .frame(width: 343, height: 48)
                .padding(.horizontal, 16)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0, green: 0.6666666667, blue: 1, alpha: 1)))
                .cornerRadius(8)
            }

        }

    }
    
}

struct FinishScreen_Previews: PreviewProvider {
    static var previews: some View {
        FinishScreen()
    }
}
