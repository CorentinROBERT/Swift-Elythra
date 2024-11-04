//
//  NationalitiesOnboarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import SwiftUI
import Combine

struct NationalitiesOnboarding: View {
    
    @State var isCountrySheetPresented: Bool = false
    @State var countries : [CountryData] = []
    @State var country : CountryData? = nil
    
    var body: some View {
        VStack{
            Text("Nationalities / Country of birth")
            CountriesPicker(selectedCountryData: $countries)
            if(!countries.isEmpty){
                ForEach(countries, id: \.self){ country in HStack{
                    Text(country.name).foregroundStyle(.black)
                    Text(country.flag)
                }}
            }
            
            Button(action: {
                isCountrySheetPresented.toggle()
            }) {
                VStack{
                    Text("Select your country of birth")
                    if(country != nil){
                        HStack{
                            Text(country!.name).foregroundStyle(.black)
                            Text(country!.flag)
                        }
                    }
                }
            }
            .sheet(isPresented: $isCountrySheetPresented) {
                CountryPicker(selectedCountryData: $country)
            }
        }
    }
}

#Preview {
    NationalitiesOnboarding()
}
