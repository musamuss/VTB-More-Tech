//
//  VTBInput.swift
//  VTB-More-Tech
//
//  Created by Vasiliy Dmitriev on 10/11/20.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct VTBInput: View {
    let type: UIKeyboardType
    let hint: String
    let footer: String
    @Binding var  input: String
    
    var body: some View {
        Column(alignment: .leading, spacing: 16) {
            TextField(hint, text: $input)
                
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .background(Rectangle()
                                .fill(Color(#colorLiteral(red: 0.3485797644, green: 0.4171846807, blue: 0.4678898454, alpha: 1)))
                                .frame(height: 46)
                                .cornerRadius(8)
                )
                .keyboardType(type)
            Text(footer)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
    }
}


//struct VTBInput_Previews: PreviewProvider {
//    static var previews: some View {
//        VTBInput()
//    }
//}
