//
//  ChipView.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import SwiftUI

struct ChipView: View {
    
    let systemImage: String
    let text: LocalizedStringKey
    @State var isSelected: Bool
    var isAllowGesture: Bool = true
    var selectedColor: Color = .blue
    var unselectedColor: Color = .white
    
    var body: some View {
        HStack(spacing: 4) {
            Image.init(systemName: systemImage).font(.body)
            Text(text).font(.body).lineLimit(1)
        }
        .padding(.vertical, 4)
        .padding(.leading, 4)
        .padding(.trailing, 10)
        .foregroundColor(isSelected ? unselectedColor : selectedColor)
        .background(isSelected ? selectedColor : unselectedColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(selectedColor, lineWidth: 1.5)
            
        ).onTapGesture {
            if(isAllowGesture){
                withAnimation {
                    isSelected.toggle()
                }
            }
        }
    }
}

#Preview {
    ChipView(systemImage: "person.crop.circle.fill", text: .init("Hello"), isSelected: true, isAllowGesture: true)
}
