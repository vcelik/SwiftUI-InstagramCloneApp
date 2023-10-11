//
//  Post.swift
//  InstagramApp
//
//  Created by Volkan Celik on 04/08/2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Post:Identifiable,Decodable{
    @DocumentID var id:String?
    let ownerUid:String
    let ownerUsername:String
    let caption:String
    var likes:Int
    let imageUrl:String
    let timestamp:Timestamp
    let ownerImageurl:String
    
    var didLike:Bool?=false
    
}


