//
//  NotificationCell.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @State private var showPostImage=true
    @ObservedObject var viewModel:NotificationCellViewModel
    
    var isFollowed:Bool{
        return viewModel.notification.isFollowed ?? false
    }
    
    init(viewModel:NotificationCellViewModel){
        self.viewModel=viewModel
    }
    
    var body: some View {
        HStack{
            if let user=viewModel.notification.user{
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width:40,height: 40)
                        .clipShape(Circle())
                    Text(viewModel.notification.username)
                        .font(.system(size: 14,weight: .semibold))
                    + Text(viewModel.notification.type.notificationMessage).font(.system(size: 15)) +
                    Text(" \(viewModel.timestampString)").foregroundColor(.gray).font(.system(size: 12))

                }

            }


            Spacer()
            
            if viewModel.notification.type != .follow{
                if let post=viewModel.notification.post{
                    NavigationLink {
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    } label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width:40,height: 40)
                            .clipped()
                    }


                }

            }else{
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14,weight: .semibold))
                        .frame(width:100,height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : .blue)
                        .cornerRadius(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: isFollowed ? 1 : 0)
                        )
                }

            }
        }
        .padding(.horizontal)
    }
}

