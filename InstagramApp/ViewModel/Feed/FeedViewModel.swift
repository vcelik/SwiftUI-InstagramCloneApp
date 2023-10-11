//
//  FeedViewModel.swift
//  InstagramApp
//
//  Created by Volkan Celik on 04/08/2023.
//

import SwiftUI
import Firebase

class FeedViewModel:ObservableObject{
    @Published var posts=[Post]()
    
    init(){
        print("Feed View Model")
        fetchPosts()
    }
    
    func fetchPosts(){
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents=snapshot?.documents else {return}
            self.posts=documents.compactMap({ try? $0.data(as: Post.self)})
            print("fetch posts")
        }
    }
}
