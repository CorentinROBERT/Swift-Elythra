//
//  PersonnalInformations.swift
//  BankingApp
//
//  Created by Corentin Robert on 23/10/2024.
//

import SwiftUI

struct PersonnalInformations: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var birthDate = Date().addingTimeInterval(-60 * 60 * 24 * 365 * 18)
    @State var sex : String = "Female"
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
            ScrollView {
                VStack (alignment: .leading) {
                    Text("Personnal informations")
                        .font(.headline)
                        .padding(.horizontal, 15)
                    VStack(alignment: .leading){
                        Text("Select your sex")
                            .padding(.horizontal, 15)
                        Picker("Sex", selection: $sex) {
                            Text("Female").tag("Female")
                            Text("Male").tag("Male")
                            Text("Without sex").tag("Without")
                        }
                        .padding(.horizontal, 15)
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    TextField("First name", text: $firstName)
                        .textContentType(.givenName)
                        .padding(.horizontal, 15)
                        .textFieldStyle(.roundedBorder)
                    TextField("Last name", text: $lastName)
                        .textContentType(.familyName)
                        .padding(.horizontal, 15)
                        .textFieldStyle(.roundedBorder)
                    DatePicker(selection: $birthDate, in: ...Date.now.addingTimeInterval(-60 * 60 * 24 * 365 * 18), displayedComponents: .date) {
                        Text("Date of birth")
                    }
                    .padding(.horizontal, 15)
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    PersonnalInformations()
}
