//
//  CountriesPicker.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import SwiftUI

struct CountriesPicker: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var countryCodeViewModel = CountryCodeViewModel()
    @Binding var selectedCountryData: [CountryData]
    @State var title : String = "Select Country(ies)"
    @State private var searchCountry: String = ""
    @State private var isPresented: Bool = false
    
    var searchResults: [CountryData] {
        if searchCountry.isEmpty {
            return countryCodeViewModel.countryCode
        } else {
            return countryCodeViewModel.countryCode.filter { $0.name.localizedCaseInsensitiveContains(searchCountry) }
        }
    }
    
    var body: some View {
        VStack{
            Button(title) {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented){
                VStack {
                    HStack {
                        Text("Select Country(ies)")
                        Spacer()
                        Button("Done") {
                            isPresented.toggle()
                        }
                    }
                    TextField("Search", text: $searchCountry)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    List {
                        ForEach(searchResults, id: \.self.code) { country in
                            Toggle(isOn: Binding<Bool>(
                                get: { selectedCountryData.contains(where: { $0.name == country.name }) },
                                set: { isOn in
                                    if isOn {
                                        selectedCountryData.append(country)
                                    } else {
                                        selectedCountryData.removeAll { $0.name == country.name }
                                    }
                                }
                            )) {
                                HStack {
                                    Text(country.name)
                                        .fontWeight(.semibold)
                                    Text(country.flag)
                                }
                            }
                            .toggleStyle(iOSCheckToggleStyle())
                            .foregroundStyle(.black)
                        }
                    }
                }
                .background(Color.white)
                .padding()
            }
        }
    }
}

#Preview {
    CountriesPicker(selectedCountryData: .constant([CountryData(name: "France",flag:"🇫🇷", code: "FR", dialCode:"+33")]))
}
