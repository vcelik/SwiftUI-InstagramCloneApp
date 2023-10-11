//
//  ProfileView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI

struct ProfileView: View {
    let user:User
    @ObservedObject var viewModel:ProfileViewModel
    
    init(user:User){
        print("Profile View Model")
        self.user=user
        self.viewModel=ProfileViewModel(user: user)
        
    }
    var body: some View {
        ScrollView{
            VStack(spacing:32){
                ProfileHeaderView(viewModel: viewModel)
                
                PostgridView(config: .profile(user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

