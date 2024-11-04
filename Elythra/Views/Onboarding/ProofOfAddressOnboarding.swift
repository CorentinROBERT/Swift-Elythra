//
//  ProofOfAddressOnboarding.swift
//  BankingApp
//
//  Created by Corentin Robert on 30/10/2024.
//

import SwiftUI
import PhotosUI

struct ProofOfAddressOnboarding: View {
    
    @State private var selection = ""
    @State var selectedItems: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var image: UIImage?
    
    @State private var presentImporter = false
    
    var body: some View {
        VStack {
            Text("Please provide a proof of address.\n\nThese can be documents in your name, dated within the last 3 months such as:\n\n• utility bills\n• rental agreements\n• or bank statements")
            ScrollView {
                // Affichage des documents ajoutés (le cas échéant)
            }
            Spacer()
            VStack {
                Button("Take photo") {
                    self.showCamera.toggle()
                }
                .fullScreenCover(isPresented: self.$showCamera) {
                    accessCameraView(selectedImage: self.$selectedImage)
                        .background(.black)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                // Intégration directe du PhotosPicker
                PhotosPicker(selection: $selectedItems, matching: .images) {
                    Text("Select from gallery")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button("Select from file") {
                    presentImporter.toggle()
                }
                .fileImporter(isPresented: $presentImporter, allowedContentTypes: [.pdf]) { result in
                    switch result {
                    case .success(let url):
                        print(url)
                    case .failure(let error):
                        print(error)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ProofOfAddressOnboarding()
}
