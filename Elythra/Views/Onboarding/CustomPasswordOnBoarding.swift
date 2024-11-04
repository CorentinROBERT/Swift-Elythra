//
//  CustomPassword.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import SwiftUI
import WrapLayout

struct CustomPasswordOnBoarding: View {
    
    @State var password: String = ""
    @State var isPwdVisible: Bool = false
    
    @State var isMinimumCharacter: Bool = false
    @State var isContainNumber: Bool = false
    @State var isContainSpecialCharacter: Bool = false
    @State var isLowercaseCharacter: Bool = false
    @State var isUppercaseCharacter: Bool = false
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 130))]
        VStack{
            ScrollView{
                VStack{
                    Text("Set your password")
                        .font(.headline)
                    Text("Your password must be at least 8 characters long, one uppercase letter, one lowercase letter, one number and one special character.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack{
                        if(isPwdVisible)
                        {
                            TextField("Password", text: $password){
                                
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .onChange(of: password){
                                updatePwd()
                            }
                        }
                        else{
                            SecureField("Password", text: $password){
                                
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .onChange(of: password){
                                updatePwd()
                            }
                        }
                        Button("",systemImage : isPwdVisible ? "eye.slash" : "eye"){
                            withAnimation{
                                isPwdVisible.toggle()
                            }
                        }
                    }
                    VStack(alignment: .center){
                        WrapLayout(horizontalSpacing: 5){
                                ChipView(
                                    systemImage: isMinimumCharacter ? "checkmark.circle.fill" : "xmark.circle.fill",
                                    text: "8 characters" ,
                                    isSelected: isMinimumCharacter,
                                    selectedColor: isMinimumCharacter ? .black : .white.opacity(0.5),
                                    unselectedColor: isMinimumCharacter ? .white : .gray)
                                
                                ChipView(
                                    systemImage: isContainNumber ? "checkmark.circle.fill" : "xmark.circle.fill",
                                    text: "Number" ,
                                    isSelected: isContainNumber,
                                    selectedColor: isContainNumber ? .black : .white.opacity(0.5),
                                    unselectedColor: isContainNumber ? .white : .gray)
                                
                                ChipView(
                                    systemImage: isContainSpecialCharacter ? "checkmark.circle.fill" : "xmark.circle.fill",
                                    text: "Special character" ,
                                    isSelected: isContainSpecialCharacter,
                                    selectedColor: isContainSpecialCharacter ? .black : .white.opacity(0.5),
                                    unselectedColor: isContainSpecialCharacter ? .white : .gray)
                                ChipView(
                                    systemImage: isUppercaseCharacter ? "checkmark.circle.fill" : "xmark.circle.fill",
                                    text: "Uppercase character" ,
                                    isSelected: isUppercaseCharacter,
                                    selectedColor: isUppercaseCharacter ? .black : .white.opacity(0.5),
                                    unselectedColor: isUppercaseCharacter ? .white : .gray)
                                ChipView(
                                    systemImage: isLowercaseCharacter ? "checkmark.circle.fill" : "xmark.circle.fill",
                                    text: "Lowercase character" ,
                                    isSelected: isLowercaseCharacter,
                                    selectedColor: isLowercaseCharacter ? .black : .white.opacity(0.5),
                                    unselectedColor: isLowercaseCharacter ? .white : .gray)
                            
                        }
                    }.padding(.horizontal, 10)
                }
            }
        }
    }
    
    func updatePwd(){
        isContainNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()_+=-[]{}|\\:;\"'<>,.?/~`")
        isContainSpecialCharacter = password.rangeOfCharacter(from: specialCharacters) != nil
        isMinimumCharacter = password.count >= 8
        isUppercaseCharacter = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        isLowercaseCharacter = password.rangeOfCharacter(from: .lowercaseLetters) != nil
    }
}

#Preview {
    CustomPasswordOnBoarding()
}
