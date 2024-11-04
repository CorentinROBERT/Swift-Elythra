//
//  CountryPicker.swift
//  BankingApp
//
//  Created by Corentin Robert on 23/10/2024.
//

import SwiftUI

struct PhoneCountryPicker: View {
    
    @ObservedObject private var countryCodeViewModel = CountryCodeViewModel()
    @State private var selectionCode = 73
    @FocusState private var hideKeyboard: Bool
    @State var phoneNumber: String = ""
    
    var body: some View {
        Picker("Select Country Code", selection : $selectionCode){
            ForEach(0..<countryCodeViewModel.countryCode.count, id: \.self){
                Text("\(countryCodeViewModel.countryCode[$0].name) \(countryCodeViewModel.countryCode[$0].flag) \(countryCodeViewModel.countryCode[$0].dialCode)")
            }
        }
        .onChange(of: selectionCode){
            print(selectionCode)
        }
    }
}

#Preview {
    PhoneCountryPicker()
}
