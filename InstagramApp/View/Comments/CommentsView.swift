//
//  CommentsView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 05/08/2023.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentText=""
    @ObservedObject var viewModel:CommentViewModel
    
    init(post:Post){
        self.viewModel=CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            //comment cells
            ScrollView{
                LazyVStack(alignment:.leading,spacing: 24){
                    ForEach(viewModel.comments){comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            .padding(.top)
            // input view
            CustomInputView(inputText: $commentText) {
                uploadComment()
            }
        }
    }
    
    func uploadComment(){
        viewModel.uploadComment(commentText: commentText)
        commentText=""
    }
}


