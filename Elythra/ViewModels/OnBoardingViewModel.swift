//
//  OnBoardingViewModel.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import Foundation
import SwiftUI

class OnBoardingViewModel {
    
    var step : OnboardingStep
    var progress : Double
    
    init() {
        self.step = .start
        self.progress = 0.0
        updateProgress()
    }
    
    func next () -> AnyView {
        switch step {
        case .start:
            step = .emailPhone
            updateProgress()
            return AnyView(EmailPhoneOnboarding())
        case .emailPhone:
            step = .otpConfirmation
            updateProgress()
            return AnyView(OtpConfirmationEmailPhone())
        case .otpConfirmation:
            step = .personnalInformation
            updateProgress()
            return AnyView(PersonnalInformations())
        case .personnalInformation:
            step = .setPassword
            updateProgress()
            return AnyView(CustomPasswordOnBoarding())
        case .setPassword:
            step = .address
            updateProgress()
            return AnyView(AddressOnBoarding())
        case .address:
            step = .proofOfAddress
            updateProgress()
            return AnyView(ProofOfAddressOnboarding())
        case .proofOfAddress:
            step = .nationalities
            updateProgress()
            return AnyView(NationalitiesOnboarding())
        case .nationalities:
            step = .sourceOfFunds
            updateProgress()
            return AnyView(SourceOfFundsOnBoarding())
        case .sourceOfFunds:
            step = .identification
            updateProgress()
            return AnyView(IdentificationOnboarding())
        case .identification:
            step = .choosePlans
            updateProgress()
            return AnyView(ChoosePlanOnBoarding())
        case .choosePlans:
            step = .customCard
            updateProgress()
            return AnyView(CustomCardOnBoarding())
        case .customCard:
            step = .agreeToTerms
            updateProgress()
            return AnyView(AgreeTermsOnBoarding())
        case .agreeToTerms:
            updateProgress()
            return AnyView(Text("next agree"))
        }
    }
    
    func previous() -> AnyView {
        switch step {
        case .start:
            updateProgress()
            return AnyView(Text(""))
        case .emailPhone:
            step = .start
            updateProgress()
            return AnyView(StartOnBoarding())
        case .otpConfirmation:
            step = .emailPhone
            updateProgress()
            return AnyView(EmailPhoneOnboarding())
        case .personnalInformation:
            step = .otpConfirmation
            updateProgress()
            return AnyView(OtpConfirmationEmailPhone())
        case .setPassword:
            step = .personnalInformation
            updateProgress()
            return AnyView(PersonnalInformations())
        case .address:
            step = .setPassword
            updateProgress()
            return AnyView(CustomPasswordOnBoarding())
        case .proofOfAddress:
            step = .address
            updateProgress()
            return AnyView(AddressOnBoarding())
        case .nationalities:
            step = .proofOfAddress
            return AnyView(ProofOfAddressOnboarding())
        case .sourceOfFunds:
            step = .nationalities
            updateProgress()
            return AnyView(NationalitiesOnboarding())
        case .identification:
            step = .sourceOfFunds
            updateProgress()
            return AnyView(SourceOfFundsOnBoarding())
        case .choosePlans:
            step = .identification
            updateProgress()
            return AnyView(IdentificationOnboarding())
        case .customCard:
            step = .choosePlans
            updateProgress()
            return AnyView(ChoosePlanOnBoarding())
        case .agreeToTerms:
            step = .customCard
            updateProgress()
            return AnyView(CustomCardOnBoarding())
        }
    }
    
    func currentStep() -> AnyView {
        switch step {
        case .start:
            updateProgress()
            return AnyView(StartOnBoarding())
        case .emailPhone:
            updateProgress()
            return AnyView(EmailPhoneOnboarding())
        case .otpConfirmation:
            updateProgress()
            return AnyView(OtpConfirmationEmailPhone())
        case .personnalInformation:
            updateProgress()
            return AnyView(PersonnalInformations())
        case .setPassword:
            updateProgress()
            return AnyView(CustomPasswordOnBoarding())
        case .address:
            updateProgress()
            return AnyView(AddressOnBoarding())
        case .proofOfAddress:
            updateProgress()
            return AnyView(ProofOfAddressOnboarding())
        case .nationalities:
            updateProgress()
            return AnyView(NationalitiesOnboarding())
        case .sourceOfFunds:
            updateProgress()
            return AnyView(SourceOfFundsOnBoarding())
        case .identification:
            updateProgress()
            return AnyView(IdentificationOnboarding())
        case .choosePlans:
            updateProgress()
            return AnyView(ChoosePlanOnBoarding())
        case .customCard:
            updateProgress()
            return AnyView(CustomCardOnBoarding())
        case .agreeToTerms:
            updateProgress()
            return AnyView(AgreeTermsOnBoarding())
        }
    }
    
    func updateProgress(){
        if let index = step.index() {
            progress = (Double(100 * (index+1) / OnboardingStep.allCases.count)/100)
        }
    }
}
