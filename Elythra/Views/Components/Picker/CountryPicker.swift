import SwiftUI

struct CountryPicker: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var countryCodeViewModel = CountryCodeViewModel()
    @Binding var selectedCountryData: CountryData?
    @State private var searchCountry: String = ""
    
    var searchResults: [CountryData] {
        if searchCountry.isEmpty {
            return countryCodeViewModel.countryCode
        } else {
            return countryCodeViewModel.countryCode.filter { $0.name.localizedCaseInsensitiveContains(searchCountry) }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Select Country")
                    .font(.headline)
                Spacer()
                Button("Cancel") {
                    dismiss()
                }
            }
            .padding()
            
            TextField("Search", text: $searchCountry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            List {
                ForEach(searchResults, id: \.code) { country in
                    HStack {
                        Text(country.name)
                            .fontWeight(.semibold)
                        Text(country.flag)
                        Spacer()
                        if selectedCountryData?.code == country.code {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle()) // Makes the whole row tappable
                    .onTapGesture {
                        selectedCountryData = country
                        dismiss() // Close the sheet after selecting a country
                    }
                }
            }
        }
        .background(Color.white)
        .padding()
    }
}

#Preview {
    CountryPicker(selectedCountryData: .constant(CountryData(name: "France", flag: "🇫🇷", code: "FR", dialCode: "+33")))
}
