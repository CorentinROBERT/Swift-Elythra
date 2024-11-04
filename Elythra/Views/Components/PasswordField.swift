//
//  PasswordField.swift
//  BankingApp
//
//  Created by Corentin Robert on 04/11/2024.
//

import SwiftUI

struct PasswordField: View {
    
    var placeholder: String
    @Binding var text: String
    @State var isSecure: Bool = true
    
    
    
    var body: some View {
        PasswordTextFieldStyle {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(.leading,10)
            } else {
                TextField(placeholder, text: $text)
                    .padding(.leading,10)
            }
            Button("",systemImage: isSecure ? "eye.slash.fill" : "eye.fill"){
                withAnimation {
                    isSecure.toggle()
                }
            }
        }
    }
}

#Preview {
    VStack{
        PasswordField(placeholder:"Test",text: .constant("123456789"))
    }
}
