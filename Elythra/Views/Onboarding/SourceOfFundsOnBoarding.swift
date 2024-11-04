//
//  SourceOfFundsOnBoarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import SwiftUI

struct SourceOfFundsOnBoarding: View {
    
    let occupations: [String] = ["Student", "Employee", "Self-Employed", "Retired" ,"Other"]
    @State var selectedOccupation : String = ""
    @State var currentEmployer : String = ""
    
    @State var sectors: [PickerViewObject] = [
        PickerViewObject(name:"Financial Services",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Technology",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Fintech",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Real Estate",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Healthcare and Pharmaceuticals",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Retail & E-commerce",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Consulting",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Manufacturing and Industry",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Energy",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Media & Entertainment",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Education",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Agriculture",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Crypto & Blockchain",createdAt:Date(),updatedAt:Date()),
        PickerViewObject(name:"Arms Trade",createdAt:Date(),updatedAt:Date()),
        
    ]
    @State var selectedSectors : [PickerViewObject] = []
    @State var selectedCountries : [CountryData] = []
    
    @State var sourceOfWealth: [String] = [
      "Salary/Employment Income",
      "Business Profits",
      "Investments",
      "Real Estate",
      "Inheritance",
      "Crypto Assets",
      "Consultancy/Professional Services",
      "Freelance/Contractor Work",
      "Savings",
      "Pension/Retirement Funds",
      "Other"
    ]
    @State var selectedSourceOfWealth : String = ""
    
    @State var taxStatus : [String] = ["Yes","No"]
    @State var selectedTaxStatus : String = ""
    
    @State var pepStatusSource : [String] = ["Yes","No"]
    @State var selectedPepStatus : String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("What is yout current occupation?")
                .padding()
            List {
                Section(header: Text("Occupation")){
                    Picker("Select occupation", selection: $selectedOccupation){
                        ForEach(occupations, id: \.self){ occupation in
                            Text(occupation)
                        }
                    }.pickerStyle(.automatic)
                    if(selectedOccupation == "Self-Employed" || selectedOccupation == "Employee")
                    {
                        TextField("Name of your current employer",text: $currentEmployer)
                    }
                }
                
                Section(header: Text("Wealth")){
                    Picker("Select primary source of wealth", selection: $selectedSourceOfWealth){
                        ForEach(sourceOfWealth, id: \.self){ occupation in
                            Text(occupation)
                        }
                    }
                }
                
                Section(header: Text("Sectors")){
                    VStack(alignment:.leading){
                        MultiplePicker(selectedItems:$selectedSectors, itemSource: $sectors, title: "What is the sector(s) of your primary source of wealth?")
                    }
                    VStack(alignment:.leading){
                        CountriesPicker(selectedCountryData : $selectedCountries, title:"What is the country(ies) of your primary source of wealth?")
                        if(!selectedCountries.isEmpty){
                            ForEach(selectedCountries, id: \.self){ country in
                                HStack{
                                    Text(country.name)
                                    Text(country.flag)
                                }
                            }
                            .padding(.top,5)
                        }
                    }
                    
                }
                
                Section(header: Text("Tax Informations")){
                    VStack(alignment: .leading){
                        Text("Are you subject to tax in the USA?")
                        Picker("Select tax status", selection: $selectedTaxStatus){
                            ForEach(taxStatus, id: \.self){ occupation in
                                Text(occupation)
                            }
                        }.pickerStyle(.automatic)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Are you politically exposed person?")
                        Picker("Select status", selection: $selectedPepStatus){
                            ForEach(pepStatusSource, id: \.self){ occupation in
                                Text(occupation)
                            }
                        }.pickerStyle(.automatic)
                    }
                }
            }
        }
        .onAppear(){
            selectedOccupation = occupations.first ?? ""
            selectedSourceOfWealth = sourceOfWealth.first ?? ""
            selectedTaxStatus = taxStatus.first ?? ""
            selectedPepStatus = pepStatusSource.first ?? ""
        }
    }
}

#Preview {
    SourceOfFundsOnBoarding()
}
