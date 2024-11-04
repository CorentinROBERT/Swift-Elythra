//
//  OnboardingEnum.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import Foundation
enum OnboardingStep: String, Codable, CaseIterable {
    case start
    case emailPhone
    case otpConfirmation
    case personnalInformation
    case setPassword
    case address
    case proofOfAddress
    case nationalities
    case sourceOfFunds
    case identification
    case choosePlans
    case customCard
    case agreeToTerms
    
    func index() -> Int? {
        return OnboardingStep.allCases.firstIndex(of: self)
    }
}
