//
//  PasswordTextFieldStyle.swift
//  BankingApp
//
//  Created by Corentin Robert on 04/11/2024.
//

import Foundation
import SwiftUI

struct PasswordTextFieldStyle<Content: View>: View {
    
    
    let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
    var radius: CGFloat = 20
    
    var body: some View {
        HStack{
            content
        }
        .padding(.vertical, 10)
        .shadow(color: .white.opacity(0.5), radius: 10)
        .foregroundStyle(.black)
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(radius)
        .overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(.black, lineWidth: 1.5)
        )
    }
}

#Preview{
    VStack{
        PasswordTextFieldStyle{
            TextField("test",text:.constant("test"))
            Image(systemName: "circle")
        }
    }
}
