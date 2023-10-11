//
//  EditProfileViewModel.swift
//  InstagramApp
//
//  Created by Volkan Celik on 06/08/2023.
//

import SwiftUI

class EditProfileViewModel:ObservableObject{
    @Published var uploadComplete=false
    var user:User
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserBio(_ bio:String){
        guard let uid=user.id else {return}
        COLLECTION_USERS.document(uid).updateData(["bio":bio]){_ in
            self.user.bio=bio   //should be before uploadcomplete because the view will dismiss
            self.uploadComplete=true
        }
    }
}
