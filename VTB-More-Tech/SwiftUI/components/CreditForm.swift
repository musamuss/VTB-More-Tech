//
//  CreditForm.swift
//  VTB-More-Tech
//
//  Created by Vasiliy Dmitriev on 10/10/20.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct CreditForm: View {
    
    @State var fio: String = ""
    @State var birth: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    
    var body: some View {
        Stack {
            Color(#colorLiteral(red: 0.1875175834, green: 0.2722267807, blue: 0.3311970234, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Column(alignment: .leading) {
                    Row {
                        Image("vtb_logo")
                            .padding(.bottom, 40)
                        Spacer()
                    }
                    Column(alignment: .leading, spacing: 20) {
                        Text("Онлайн-заявка на кредит")
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        Text("Узнайте решение банка и ваши персональные условия на автокредит меньше, чем за 3 минуты")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        Text("Укажите ваши контактные данные")
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(.top, 34)
                    }
                    Column(alignment: .leading, spacing: 30) {
                        VTBInput(type: .default, hint: "Фамилия Имя Отчество", footer: "Укажите так, как написано в вашем паспорте", input: $fio)
                        VTBInput(type: .default, hint: "Дата рождения (дд.мм.гггг)", footer: "Укажите дату своего рождения", input: $birth)
                        VTBInput(type: .phonePad, hint: "Мобильный телефон", footer: "На этот номер мы вышлем вам СМС с решеним банка", input: $phone)
                        VTBInput(type: .emailAddress, hint: "Электронная почта", footer: "На эту почту вы получите дополнительную информацию по вашему автокредиту", input: $email)
                    }
                    .padding(.top, 40)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Подать заявку")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    })
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.001224983018, green: 0.668161869, blue: 0.9994378686, alpha: 1)))
                    .cornerRadius(8)
                    .padding(.top, 16)
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
        }
    }
}




struct CreditForm_Previews: PreviewProvider {
    static var previews: some View {
        CreditForm()
    }
}
