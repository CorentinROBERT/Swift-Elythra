//
//  iOSCheckboxToggleStyle.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import Foundation
import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            withAnimation{
                configuration.isOn.toggle()
            }

        }, label: {
            if(configuration.isOn)
            {
                Image(systemName: "checkmark.square")
            }
            else{
                Image(systemName: "square")
            }
        })
    }
}
