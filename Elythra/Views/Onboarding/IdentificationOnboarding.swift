//
//  IdentificationOnboarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 26/10/2024.
//

import SwiftUI
import StepperView

struct IdentificationOnboarding: View {
    
    let steps = [ TextView(text:"Ensure you have a valid ID document.\nIt must not be a photocopy and should not be expired. The documents accepted are : \n  • national passpor \n  • or national ID card.", font: .system(size: 14, weight: .semibold)),
                  TextView(text:"Hold your phone steady and allow your camera to focus to avoid blurry photos.", font: .system(size: 14, weight: .semibold)),
                  TextView(text:"Choose a well-lit location to avoid shadows on your face or ID.", font: .system(size: 14, weight: .semibold))
    ]
    
    let indicationTypes = [
        StepperIndicationType.custom(NumberedCircleView(text: "1", width: 40, color: .blue).eraseToAnyView()),
        StepperIndicationType.custom(NumberedCircleView(text: "2", width: 40, color: .blue).eraseToAnyView()),
        StepperIndicationType.custom(NumberedCircleView(text: "3", width: 40, color: .blue).eraseToAnyView())
    ]
    
    var body: some View {
        VStack(){
            Text("To comply with legal requierements we need to verify your identity.")
            Text("Before you begin:")
            StepperView()
                .alignments([.top,.center,.center])
                .addSteps(steps)
                .indicators(indicationTypes)
                .stepIndicatorMode(StepperMode.vertical)
                .lineOptions(StepperLineOptions.custom(3, .blue))
            Text("Your ID will undergo revalidation. If it’s unclear or not accepted, you may be contacted to undergo the ID verification again.\n\nRest assured that all data are processed within the highest standards of privacy &amp; confidentiality.")
                .font(.caption)
                .padding(.bottom, 10)
            Button("Launch Id Verification"){

            }
        }.padding()
    }
}

#Preview {
    IdentificationOnboarding()
}
