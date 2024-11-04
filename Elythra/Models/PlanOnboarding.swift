//
//  PlanOnboarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 28/10/2024.
//

import Foundation
class PlanOnboarding: Codable,Equatable,Hashable {
    static func == (lhs: PlanOnboarding, rhs: PlanOnboarding) -> Bool {
        lhs.id == rhs.id
    }
    
    var id : UUID = UUID()
    var name : String
    var image : String
    var description : String
    var price : Double
    var createdAt : Date = Date()
    
    var numberFreeWithdrawalOwnCountry : Int
    var numberSubAccounts : Int
    var isPremiumFeatures : Bool
    
    init(name: String, image: String, description: String, price: Double, numberFreeWithdrawalOwnCountry: Int, numberSubAccounts: Int, isPremiumFeatures: Bool) {
        self.name = name
        self.image = image
        self.description = description
        self.price = price
        self.numberFreeWithdrawalOwnCountry = numberFreeWithdrawalOwnCountry
        self.numberSubAccounts = numberSubAccounts
        self.isPremiumFeatures = isPremiumFeatures
    }
    
    func toString() -> String {
        return "PlanOnboarding: \(name) \(image) \(description) \(price) \(numberFreeWithdrawalOwnCountry) \(numberSubAccounts) \(isPremiumFeatures)"
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
