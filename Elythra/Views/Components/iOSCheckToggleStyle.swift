//
//  iOSCheckboxToggleStyle.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import Foundation
import SwiftUI

struct iOSCheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()

        }, label: {
            HStack {
                configuration.label
                Spacer()
                if(configuration.isOn)
                {
                    Image(systemName: "checkmark")
                }
            }
        })
    }
}
