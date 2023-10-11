//
//  ProfileHeaderView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var  viewModel:ProfileViewModel
    var body: some View {
        VStack(alignment:.leading){
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width:80,height:80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                
                HStack(spacing:16){
                    if let stats=viewModel.user.stats{//The entire view wont show up until fetching is done
                        UserStatView(value: stats.posts, title: "Post")
                        UserStatView(value: stats.followers, title: "Followers")
                        UserStatView(value: stats.following, title: "Following")
                    }
                    
                    //UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Post")        Until fetching it will display 0 this way
                    //UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    //UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")

                }.padding(.trailing,32)

            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15,weight: .semibold))
                .padding([.leading,.top])
            
            if let bio=viewModel.user.bio{
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top,1)
            }
            

            
            HStack {
                Spacer()
                ProfileActionButtonView(viewModel: viewModel)
                Spacer()
            }
            .padding(.top)

            
        }
    }
}


