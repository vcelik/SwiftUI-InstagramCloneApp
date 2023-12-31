//
//  ResetPasswordView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Binding private  var email:String
    @EnvironmentObject var viewModel:AuthViewModel
    @Environment(\.presentationMode) var mode
    
    init(email:Binding<String>){
        self._email=email
    }
    

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple,.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Image("instagram_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width:220,height: 100)
                    .foregroundColor(.white)
                
                VStack(spacing:20){
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                    
                }
                
                Button {
                    viewModel.resetPassword(withEmail: email)
                } label: {
                    Text("Send Reset Password Link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:360,height: 50)
                        .background(.purple)
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                })
                .padding(.bottom,16)
                }
            .padding(.top,-44)
            }
        
        .onReceive(viewModel.$didSendResetPasswordLink){_ in
            self.mode.wrappedValue.dismiss()
        }
    }
}


