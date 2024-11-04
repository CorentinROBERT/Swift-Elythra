//
//  LoginView.swift
//  BankingApp
//
//  Created by Corentin Robert on 04/11/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State var login: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
            TextField("Login",text: $login)
                .foregroundStyle(.white)
                .textFieldStyle(OvalTextFieldStyle())
                .padding(.horizontal,20)
                .padding(.bottom,10)
            PasswordField(placeholder:"Password",text: $password)
                .foregroundStyle(.white)
                .padding(.horizontal,20)
            Button("Login"){
                appState.isLoggedIn = true
            }
            .padding(.horizontal,60)
            .padding(.vertical,10)
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 10)
            .shadow(color: .white.opacity(1), radius: 5, x: 0, y: 0)
            .padding(.top,20)
            .padding(.top,20)
            HStack{
                Spacer()
                Button("Forget password ?")
                {
                    
                }
                .padding(.trailing,20)
            }
            .padding(.top,20)
            Spacer()
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(.white)
                NavigationLink("Sign in"){
                    OnboardingView()
                }
                .foregroundStyle(.blue)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    LoginView()
}
