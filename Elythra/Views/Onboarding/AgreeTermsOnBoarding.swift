//
//  AgreeTermsOnBoarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 31/10/2024.
//

import SwiftUI

struct AgreeTermsOnBoarding: View {
    
    @State var isDepositProtection : Bool = false
    @State var isRisks : Bool = false
    
    var body: some View {
        Text("We ask you to agree to the specificities of our business to foster a transparent and mutually respectful relationship.")
        VStack(alignment: .leading){
            HStack{
                Toggle(isOn: $isDepositProtection){}
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .foregroundStyle(.black)
                Text("I accept and understand that my deposits with Bank are not covered under any _depositor protection scheme_.")
                    .onTapGesture {
                        isDepositProtection.toggle()
                    }
            }
            HStack{
                Toggle(isOn: $isRisks){}
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .foregroundStyle(.black)
                Text("I accept and understand the _risks_ linked to Bank’s business model.")
                    .onTapGesture {
                        isRisks.toggle()
                    }
            }
        }
        .padding(.horizontal,15)
        .padding(.top,10)
    }
}

#Preview {
    AgreeTermsOnBoarding()
}
