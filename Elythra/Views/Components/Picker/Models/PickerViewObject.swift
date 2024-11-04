//
//  PickerViewObject.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import Foundation
struct PickerViewObject : Codable, Hashable {
    var id: UUID = UUID()
    let name : String
    var description : String? = nil
    var image : String? = nil
    let createdAt : Date
    let updatedAt : Date
}
