//
//  HomeView.swift
//  BankingApp
//
//  Created by Corentin Robert on 04/11/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            CardView()
                .tabItem { Label("Card", systemImage: "creditcard") }
            PreferenceView()
                .tabItem { Label("Settings", systemImage: "gearshape")}
        }
    }
}

#Preview {
    MainView()
}
