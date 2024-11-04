//
//  EmailPhoneOnboarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import SwiftUI

struct EmailPhoneOnboarding: View {
    
    @State var email: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading,spacing: 10){
                    Text("Please insert your phone number and email")
                        .font(.headline)
                    Text("To confirm you don't have already open account we need to verify your identity.")
                        .font(.subheadline)
                    HStack(spacing: 0){
                        PhoneCountryPicker()
                        TextField("Phone number", text: $phoneNumber)
                            .textContentType(.telephoneNumber)
                    }
                    .border(Color.gray.opacity(0.1), width: 1)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray.opacity(0.1), lineWidth: 1)
                    )
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal,10)
            }
        }
    }
}

#Preview {
    EmailPhoneOnboarding()
}
