//
//  CountryCodeViewModel.swift
//  BankingApp
//
//  Created by Corentin Robert on 23/10/2024.
//

import Foundation

class CountryCodeViewModel: ObservableObject {
    @Published var countryCode = [CountryData]()
    
    init() {
        loadData()
    }
    
    
    func loadData() {
        guard let countryCodeData = Bundle.main.url(forResource: "countryCode", withExtension: "json")
        else {
            print("Could not find country code data file")
            return
        }
        let data = try? Data(contentsOf: countryCodeData)
        let code = try? JSONDecoder().decode([CountryData].self, from: data!)
        self.countryCode = code!
    }
}
