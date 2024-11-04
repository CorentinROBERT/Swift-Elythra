//
//  ContentView.swift
//  BankingApp
//
//  Created by Corentin Robert on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var appState = AppState()
    
    var body: some View {
        if appState.isLoggedIn {
            withAnimation{
                MainView()
                    .environmentObject(appState)
            }
        }
        else{
            withAnimation{
                LoginHomePage()
                    .environmentObject(appState)
            }
        }
    }
}

#Preview {
    ContentView()
}
