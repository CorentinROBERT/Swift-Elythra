//
//  ChoosePlanOnBoarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 28/10/2024.
//

import SwiftUI

struct ChoosePlanOnBoarding: View {
    
    @State var selectedPlan: String = "Standard"
    var plans: [PlanOnboarding] = [
        PlanOnboarding(name: "Standard", image: "standard_card", description: "Standard Plan include 3 free withdrawals by month and others features.", price: 10.99,numberFreeWithdrawalOwnCountry: 3 , numberSubAccounts: 3, isPremiumFeatures: false),
        PlanOnboarding(name: "Premium", image: "premium_card", description: "Premium Plan unlock premium features", price: 14.99,numberFreeWithdrawalOwnCountry: 5 , numberSubAccounts: 5, isPremiumFeatures: true),
        PlanOnboarding(name: "Metal", image: "metal_card", description: "Metal Plan access to all features and unlimited withdrawals", price: 19.99,numberFreeWithdrawalOwnCountry: 10 , numberSubAccounts: 10, isPremiumFeatures: true),
    ]
    
    @State var currentSelectedPlan: PlanOnboarding?
    
    var body: some View {
        Form() {
            
            VStack {
                Text("Choose your plan")
                
                Picker("Select a plan", selection: $selectedPlan) {
                    ForEach(plans, id: \.id) { plan in
                        Text(plan.name).tag(plan.name)
                    }
                }
                .onChange(of: selectedPlan) {
                    currentSelectedPlan = plans.first(where: { $0.name == selectedPlan })
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TabView(selection: $selectedPlan) {
                    ForEach(plans, id: \.id) { plan in
                        VStack {
                            if !plan.image.isEmpty {
                                Image(plan.image)
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                            }
                            Text(plan.description)
                                .padding()
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                                .background(Color.black.opacity(0.5))
                            
                            Text("€\(plan.price, specifier: "%.2f")/month")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(.horizontal, 30)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Text("Annual membership")
                                .font(.caption)
                        }
                        .tag(plan.name)
                        .padding(.bottom)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(height: 600)
                .padding(.bottom)
            }
            
            Section(header: Text("Your Mastercard Debit")) {
                HStack {
                    Image(systemName: "creditcard")
                    VStack(alignment: .leading) {
                        Text("An 18 grams standard card")
                        Text("Accepted worldwide")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                
                HStack {
                    Image(systemName: "dollarsign.bank.building")
                    VStack(alignment: .leading) {
                        Text("Up to ")+Text("\(currentSelectedPlan?.numberFreeWithdrawalOwnCountry ?? 0)").fontWeight(.bold)+Text(" free withdrawals")
                        Text("In your country")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                
                HStack {
                    Image(systemName: "network")
                    VStack(alignment: .leading) {
                        Text("Free payment worldwide")
                        Text("In any currency")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    VStack(alignment: .leading) {
                        Text("Free ATM withdrawals abroad")
                        Text("In any currency")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
            }
            .listRowSeparator(.hidden)
            .padding(.horizontal)
            
            Section(header: Text("Your Insurance Package")) {
                HStack {
                    Image(systemName: "airplane")
                    VStack(alignment: .leading) {
                        Text("Travel insurance")
                        Text("Medical expense abroad, trip cancellation, and flight and baggage delays")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                HStack {
                    Image(systemName: "motorcycle")
                    VStack(alignment: .leading) {
                        Text("Lifestyle insurance")
                        Text("For shared vehicules and winter sports")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                HStack {
                    Image(systemName: "car")
                    VStack(alignment: .leading) {
                        Text("Car rental insurance")
                        Text("Away from home")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                HStack {
                    Image(systemName: "smartphone")
                    VStack(alignment: .leading) {
                        Text("Phone insurance")
                        Text("For dommages and theft")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
            }
            .listRowSeparator(.hidden)
            .padding(.horizontal)
            
            if(currentSelectedPlan?.isPremiumFeatures ?? false){
                Section(header: Text("Your premium features")) {
                    HStack {
                        Image(systemName: "square.grid.2x2")
                        VStack(alignment: .leading) {
                            Text("Up to ").fontWeight(.regular) + Text("\(currentSelectedPlan?.numberSubAccounts ?? 0)").fontWeight(.bold) + Text(" sub-accounts").fontWeight(.regular)
                            Text("With bank account space")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                    
                    HStack {
                        Image(systemName: "person.2.fill")
                        VStack(alignment: .leading) {
                            Text("Shared sub-accounts")
                            Text("With 10 bank users")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                    
                    HStack {
                        Image(systemName: "centsign.circle")
                        VStack(alignment: .leading) {
                            Text("Round up card purchases")
                            Text("To save easily")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                    
                    HStack {
                        Image(systemName: "ticket")
                        VStack(alignment: .leading) {
                            Text("Partner offers")
                            Text("Selected for you")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.horizontal)
            }
        }
        .onAppear {
            currentSelectedPlan = plans.first
        }
    }
}

#Preview {
    ChoosePlanOnBoarding()
}
