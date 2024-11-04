//
//  Start.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import SwiftUI
import StepperView

struct StartOnBoarding: View {
    
    let steps = [ Text("Start"),
                  Text("Personnal Information"),
                  Text("Delivery Address"),
                  Text("KYC, source of funds"),
                  Text("Choose plan"),
                  Text("Finnish")
    ]
    
    let indicationTypes = [
        StepperIndicationType.custom(NumberedCircleView(text: "1", width: 40 , color: .blue)),
        StepperIndicationType.custom(NumberedCircleView(text: "2", width: 40, color: .blue)),
        StepperIndicationType.custom(NumberedCircleView(text: "3", width: 40, color: .blue)),
        StepperIndicationType.custom(NumberedCircleView(text: "4", width: 40, color: .blue)),
        StepperIndicationType.custom(NumberedCircleView(text: "5", width: 40, color: .blue)),
        StepperIndicationType.custom(NumberedCircleView(text: "6", width: 40, color: .blue))
    ]
    
    var body: some View {
        VStack{
            Text("Start Onboarding")
            ScrollView{
                StepperView()
                    .addSteps(steps)
                    .indicators(indicationTypes)
                    .stepIndicatorMode(StepperMode.vertical)
                    .spacing(35)
                    .lineOptions(StepperLineOptions.custom(3, .blue))
                    .stepLifeCycles([StepLifeCycle.completed,
                                     StepLifeCycle.completed,
                                     StepLifeCycle.completed,
                                     StepLifeCycle.completed,
                                     StepLifeCycle.pending,
                                     StepLifeCycle.pending])
            }
            Text("(Approximate time: 10 minutes)")
                .padding()
            Text("Need your passport or Id card ready")
                .padding()
                
        }
        
    }
}

#Preview {
    StartOnBoarding()
}
