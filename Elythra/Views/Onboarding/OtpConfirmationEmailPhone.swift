//
//  OtpConfirmationEmailPhone.swift
//  BankingApp
//
//  Created by Corentin Robert on 24/10/2024.
//

import SwiftUI

struct OtpConfirmationEmailPhone: View {
    @State var smsCode: String = ""
    @State var emailCode: String = ""
    
    @State var isSmsValid: Bool = false
    @State var isEmailValid: Bool = false
    
    @State var isSmsLoading: Bool = false
    @State var isEmailLoading: Bool = false
    
    @State var smsSenderTimer : Timer?
    @State var emailSenderTimer : Timer?
    
    @State var smsTimeRemaining: Int = 20
    @State var emailTimeRemaining: Int = 20
    
    var body: some View {
        VStack{
            ScrollView{
                Text("Confirm your email and phone number")
                    .font(.headline)
                    .padding()
                VStack{
                    if isSmsValid
                    {
                        HStack(spacing: 0){
                            Text("The SMS code has been validated")
                                .padding(.trailing, 5)
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    else
                    {
                        HStack{
                            Text("Enter your Sms code received")
                                .padding()
                            if(isSmsLoading)
                            {
                                ProgressView()
                            }
                        }
                        OtpField(code: $smsCode,onComplete: {
                            print(smsCode)
                        })
                        Button("Resend Sms Code (\(smsTimeRemaining)s)"){
                            smsSenderTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                                if smsTimeRemaining > 0
                                {
                                    smsTimeRemaining -= 1
                                }
                                else{
                                    smsTimeRemaining = 20
                                    smsSenderTimer?.invalidate()
                                }
                            }
                        }
                        .disabled(smsTimeRemaining != 20)
                        
                    }
                    
                }
                VStack{
                    if(isEmailValid)
                    {
                        HStack(spacing: 0){
                            Text("The Email code has been validated")
                                .padding(.trailing, 5)
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    else {
                        HStack{
                            Text("Enter your Email code received")
                                .padding()
                            if(isEmailLoading)
                            {
                                ProgressView()
                            }
                        }
                        OtpField(code:$emailCode,onComplete: {
                            print(emailCode)
                        })
                        Button("Resend Mail Code (\(emailTimeRemaining)s)"){
                            emailSenderTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                                if emailTimeRemaining > 0
                                {
                                    emailTimeRemaining -= 1
                                }
                                else{
                                    emailTimeRemaining = 20
                                    emailSenderTimer?.invalidate()
                                }
                            }
                        }
                        .disabled(emailTimeRemaining != 20)
                        Button("Open email app"){
                            Util().openMail()
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    OtpConfirmationEmailPhone()
}
