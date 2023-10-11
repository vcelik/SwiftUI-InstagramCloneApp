//
//  Comment.swift
//  InstagramApp
//
//  Created by Volkan Celik on 05/08/2023.
//

import FirebaseFirestoreSwift
import Firebase
struct Comment:Identifiable,Decodable{
    @DocumentID var id:String?
    let username:String
    let postOwnerUid:String
    let profileImageUrl:String
    let commonText:String
    let timestamp:Timestamp
    let uid:String
    
    
    var timestampString:String?{
        let formatter=DateComponentsFormatter()
        formatter.allowedUnits=[.second,.minute,.hour,.day,.weekOfMonth]
        formatter.maximumUnitCount=1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}


