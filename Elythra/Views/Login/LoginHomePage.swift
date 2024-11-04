//
//  LoginPage.swift
//  BankingApp
//
//  Created by Corentin Robert on 23/10/2024.
//

import SwiftUI

struct LoginHomePage: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack {
            VStack{
                ImageCarousel()
                    .background(.black)
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink("login".localize()) {
                        LoginView()
                            .environmentObject(appState)
                    }
                    .padding(.horizontal, 20).padding(.vertical,5)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(20)
                    Spacer()
                    NavigationLink("register".localize()) {
                        OnboardingView()
                    }
                    .padding(.horizontal, 20).padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1)
                    )
                    Spacer()
                }
            }
            .background(.black)
        }
    }
}

#Preview {
    LoginHomePage()
}
