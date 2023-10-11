//
//  EditProfileView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 06/08/2023.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText:String
    @Binding var user:User
    @ObservedObject var viewModel:EditProfileViewModel
    @Environment(\.presentationMode) var mode
    
    init(user:Binding<User>){
        self._user=user
        self.viewModel=EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText=State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button {
                    viewModel.saveUserBio(bioText)
                } label: {
                    Text("Done").bold()
                }
                
            }.padding()
            
            TextArea(placeholder: "Add your bio...", text: $bioText)
                .frame(width:370,height: 200)
                .padding()
            
            Spacer()
        }
        
        .onReceive(viewModel.$uploadComplete) { completed in  //first starts with false value and dismiss immediately if viewmodel.uploadComplete not published property
            if completed{
                self.mode.wrappedValue.dismiss()
                self.user.bio=viewModel.user.bio
            }

        }
    }
}


