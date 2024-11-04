//
//  CountriesPicker.swift
//  BankingApp
//
//  Created by Corentin Robert on 25/10/2024.
//

import SwiftUI

struct MultiplePicker: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectedItems: [PickerViewObject]
    @Binding var itemSource: [PickerViewObject]
    @State var title : String = "Select items"
    @State private var searchItem: String = ""
    @State var isSheetPresented: Bool = false
    
    var searchResults: [PickerViewObject] {
        if searchItem.isEmpty {
            return itemSource
        } else {
            return itemSource.filter { $0.name == searchItem }
        }
    }
    
    var body: some View {
        VStack{
            HStack {
                Button(title){
                    isSheetPresented.toggle()
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isSheetPresented, content: {
                VStack {
                    HStack {
                        Text(title)
                        Spacer()
                        Button("Done") {
                            isSheetPresented.toggle()
                        }
                    }
                    TextField("Search", text: $searchItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    List {
                        ForEach(searchResults, id: \.self.id) { item in
                            Toggle(isOn: Binding<Bool>(
                                get: { selectedItems.contains(where: { $0.name == item.name }) },
                                set: { isOn in
                                    if isOn {
                                        selectedItems.append(item)
                                    } else {
                                        selectedItems.removeAll { $0.name == item.name }
                                    }
                                }
                            )) {
                                HStack {
                                    Text(item.name)
                                        .fontWeight(.semibold)
                                    if item.image != nil {
                                        Image(item.image!)
                                    }
                                }
                            }
                            .toggleStyle(iOSCheckToggleStyle())
                            .foregroundStyle(.black)
                        }
                    }
                }
                .background(Color.white)
                .padding()
            }
            )}
        ForEach(selectedItems, id: \.self.id) { item in
            Text(item.name)
        }
        .padding(.top,5)
    }
}

#Preview {
    @Previewable @State var itemSource: [PickerViewObject] = [
        PickerViewObject(id: UUID(), name: "France", description: "This is a description for France", image: "france",createdAt: Date(), updatedAt: Date()),
        PickerViewObject(id: UUID(), name: "Germany", description: "This is a description for Germany", image: "germany",createdAt: Date(), updatedAt: Date()),
        PickerViewObject(id: UUID(), name: "Spain", description: "This is a description for Spain", image: "spain",createdAt: Date(), updatedAt: Date()),
    ]
    
    @Previewable @State var selectedItems: [PickerViewObject] = []
    
    MultiplePicker(selectedItems: $selectedItems, itemSource: $itemSource)
}
