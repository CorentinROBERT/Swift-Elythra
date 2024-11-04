//
//  CustomCardOnBoarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 31/10/2024.
//

import SwiftUI

struct CustomCardOnBoarding: View {
    
    @State var isNumberOnCard:Bool = true
    @State var isFlippedCard:Bool = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    var body: some View {
        VStack{
            CreditCardView(isNumberVisible:$isNumberOnCard,isFlipped: $isFlippedCard,firstName:$firstName,lastName:$lastName)
            VStack{
                Button("Swipe card"){
                    isFlippedCard.toggle()
                }.padding()
                HStack(){
                    Text("Do you want engrave card numbers?")
                    Toggle(isOn: $isNumberOnCard){}
                    .foregroundStyle(.black)
                    .toggleStyle(iOSCheckboxToggleStyle())
                }.padding(.horizontal, 15)
                TextField("First name",text:$firstName){
                    
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal,15)
                TextField("Last name",text:$lastName){
                    
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal,15)
            }
        }
    }
}

#Preview {
    CustomCardOnBoarding()
}
