//
//  OvalTextFieldStyle.swift
//  BankingApp
//
//  Created by Corentin Robert on 04/11/2024.
//

import Foundation
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .white.opacity(0.5), radius: 10)
            .foregroundStyle(.black)
    }
}

#Preview{
    VStack{
        TextField("test",text:.constant("test"))
            .textFieldStyle(OvalTextFieldStyle())
            .padding()
    }
    .background(Color.black)
    .frame(width:400,height:400)
}
