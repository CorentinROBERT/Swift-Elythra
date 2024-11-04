//
//  OtpField.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import SwiftUI

struct OtpField: View {
    
    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix
    }
    
    @FocusState private var pinFocusState : FocusPin?
    
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var pinFive: String = ""
    @State var pinSix: String = ""
    
    @Binding var code : String
    var onComplete: (() -> Void)?
    
    var body: some View {
        HStack(spacing:10, content: {
            
            TextField("", text: $pinOne)
                .modifier(OtpModifer(pin:$pinOne))
                .onChange(of:pinOne){newVal in
                    if (newVal.count == 1) {
                        
                        pinFocusState = .pinTwo
                    }
                    updateCode()
                }
                .focused($pinFocusState, equals: .pinOne)
            
            TextField("", text:  $pinTwo)
                .modifier(OtpModifer(pin:$pinTwo))
                .onChange(of:pinTwo){newVal in
                    if (newVal.count == 1) {
                        pinFocusState = .pinThree
                    }else {
                        if (newVal.count == 0) {
                            pinFocusState = .pinOne
                        }
                    }
                    updateCode()
                }
                .focused($pinFocusState, equals: .pinTwo)
            
            
            TextField("", text:$pinThree)
                .modifier(OtpModifer(pin:$pinThree))
                .onChange(of:pinThree){newVal in
                    if (newVal.count == 1) {
                        pinFocusState = .pinFour
                    }else {
                        if (newVal.count == 0) {
                            pinFocusState = .pinTwo
                        }
                    }
                    updateCode()
                }
                .focused($pinFocusState, equals: .pinThree)
            
            
            TextField("", text:$pinFour)
                .modifier(OtpModifer(pin:$pinFour))
                .onChange(of:pinFour){newVal in
                    if (newVal.count == 1) {
                        pinFocusState = .pinFive
                    }else {
                        if (newVal.count == 0) {
                            pinFocusState = .pinThree
                        }
                    }
                    updateCode()
                }
                .focused($pinFocusState, equals: .pinFour)
            
            TextField("", text:$pinFive)
                .modifier(OtpModifer(pin:$pinFive))
                .onChange(of:pinFive){newVal in
                    if (newVal.count == 1) {
                        pinFocusState = .pinSix
                    }else {
                        if (newVal.count == 0) {
                            pinFocusState = .pinFour
                        }
                    }
                    updateCode()
                }
                .focused($pinFocusState, equals: .pinFive)
            
            
            TextField("", text:$pinSix)
                .modifier(OtpModifer(pin:$pinSix))
                .onChange(of:pinSix){newVal in
                    if (newVal.count == 0) {
                        pinFocusState = .pinFive
                    }
                    updateCode()
                }
                .focused($pinFocusState, equals: .pinSix)
            
            
        })
    }
    
    func updateCode(){
        code = pinOne + pinTwo + pinThree + pinFour + pinFive + pinSix
        if(code.count == 6){
            onComplete?()
        }
    }
}

#Preview {
    OtpField(code:.constant("123456"))
}
