//
//  FeedCell.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel:FeedCellViewModel
    
    var didLike:Bool{
        return viewModel.post.didLike ?? false
    }
    
    init(viewModel:FeedCellViewModel){
        self.viewModel=viewModel
    }
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                KFImage(URL(string: viewModel.post.ownerImageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width:36,height:36)
                    .clipped()
                    .cornerRadius(18)
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14,weight: .semibold))
            }
            .padding([.leading,.bottom],8)
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight:440)
                .clipped()
            HStack(spacing:16){
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width:20,height:20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                }
                
                NavigationLink {
                    CommentsView(post: viewModel.post)
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20,height:20)
                        .font(.system(size: 20))
                        .padding(4)

                }

                

                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20,height:20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                }

            }
            .padding(.leading,4)
            .foregroundColor(.black)
            
            Text(viewModel.likeString)
                .font(.system(size: 14,weight: .semibold))
                .padding(.leading,8)
                .padding(.bottom,2)
            
            HStack{
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14,weight: .semibold))
                + Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
            }
            .padding(.horizontal,8)
            Text(viewModel.timestampString)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding([.leading],8)
                .padding(.top,-2)
            
        }
        
    }
}


