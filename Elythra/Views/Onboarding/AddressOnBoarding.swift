import SwiftUI

struct AddressOnBoarding: View {
    
    @State var streetName: String = ""
    @State var streetNumber: String = ""
    @State var city: String = ""
    @State var postalCode: String = ""
    @State var additionalInformation: String = ""
    @State var country: String = ""
    @State var searchAddress: String = ""
    @State var suggestions: [String] = []
    @State var isAutomaticAddress: Bool = true
    
    var allSuggestions = ["25 rue de la navigation", "10 rue de la gare"]
    
    // Nouvelle variable d'état pour suivre la sélection
    @State private var hasSelectedSuggestion: Bool = false
    
    var body: some View {
        VStack {
            Text("Address Onboarding")
                .padding()
            ScrollView {
                VStack(alignment: .leading) {
                    if isAutomaticAddress {
                        VStack(alignment: .leading) {
                            Text("Automatic address")
                                .padding(.horizontal, 15)
                            
                            TextField("Enter your residence address", text: $searchAddress)
                                .textContentType(.streetAddressLine1)
                                .padding(.horizontal, 15)
                                .textFieldStyle(.roundedBorder)
                                .onChange(of: searchAddress) { newValue in
                                    if !hasSelectedSuggestion {
                                        updateSuggestions(for: newValue)
                                    }
                                    else{
                                        hasSelectedSuggestion = false
                                    }
                                }
                            
                            if !suggestions.isEmpty {
                                VStack(alignment: .leading) {
                                    ForEach(suggestions, id: \.self) { suggestion in
                                        HStack{
                                            Image(systemName: "mappin.and.ellipse.circle.fill")
                                                .foregroundStyle(.blue)
                                            Text(suggestion)
                                                .foregroundColor(.black)
                                                .onTapGesture {
                                                    withAnimation {
                                                        searchAddress = suggestion
                                                        suggestions = []
                                                        hasSelectedSuggestion = true
                                                    }
                                                }
                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 10)
                                    }
                                }
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .padding(.horizontal, 15)
                            }
                            
                            Button("Enter manual address") {
                                withAnimation(.easeInOut) {
                                    isAutomaticAddress.toggle()
                                }
                                hasSelectedSuggestion = false
                            }
                            .padding(.horizontal, 15)
                        }
                    } else {
                        Text("Manual address")
                            .padding(.horizontal, 15)
                        TextField("Street name", text: $streetName)
                            .textContentType(.streetAddressLine1)
                            .padding(.horizontal, 15)
                            .textFieldStyle(.roundedBorder)
                        TextField("Street number", text: $streetNumber)
                            .padding(.horizontal, 15)
                            .textFieldStyle(.roundedBorder)
                        TextField("City", text: $city)
                            .textContentType(.location)
                            .padding(.horizontal, 15)
                            .textFieldStyle(.roundedBorder)
                        TextField("Postal code", text: $postalCode)
                            .textContentType(.postalCode)
                            .padding(.horizontal, 15)
                            .textFieldStyle(.roundedBorder)
                        TextField("Additional information", text: $additionalInformation)
                            .textContentType(.streetAddressLine2)
                            .padding(.horizontal, 15)
                            .textFieldStyle(.roundedBorder)
                        Button("Enter automatic address") {
                            withAnimation(.easeInOut) {
                                isAutomaticAddress.toggle()
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                }
            }
        }
    }
    
    private func updateSuggestions(for query: String) {
        if query.isEmpty {
            suggestions = [] // Effacer les suggestions si le champ est vide
        } else {
            // Filtrer les suggestions basées sur le texte saisi
            suggestions = allSuggestions.filter { $0.lowercased().contains(query.lowercased()) }
        }
    }
}

#Preview {
    AddressOnBoarding()
}
