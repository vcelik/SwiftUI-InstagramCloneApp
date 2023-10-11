//
//  UserCell.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user:User
    var body: some View {
        HStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48,height: 48)
                .clipShape(Circle())
            VStack(alignment:.leading){
                Text(user.username)
                    .font(.system(size: 14,weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}


