//
//  CountryCode.swift
//  BankingApp
//
//  Created by Corentin Robert on 23/10/2024.
//

import Foundation

struct CountryCode : Codable {
    let countryCode : [CountryData]
}

struct CountryData : Codable, Hashable {
    let name, flag, code, dialCode : String
    
    enum CodingKeys: String, CodingKey {
        case name, flag, code
        case dialCode = "dial_code"
    }
}
