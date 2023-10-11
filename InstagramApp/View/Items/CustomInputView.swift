//
//  CustomInputView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 05/08/2023.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText:String
    var action:()->Void
    var body: some View {
        VStack{
            //divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width:UIScreen.main.bounds.width,height: 0.75)
                .padding(.bottom,8)
            //hstack with send button and textfield/
            HStack{
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button {
                    action()
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }

            }
            .padding(.bottom,8)
            .padding(.horizontal)
        }

    }
}


