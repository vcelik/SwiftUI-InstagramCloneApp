//
//  UploadPostView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage:UIImage?
    @State var postImage:Image?
    @State var captionText=""
    @Binding var tabIndex:Int
    @State var imagePickerPresented=false
    @ObservedObject var viewModel=UploadPostViewModel()
    
    var body: some View {
        VStack {
            
            if postImage == nil{
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image("plus_photo")
                        .resizable()
                        //.renderingMode(.template)
                        .scaledToFill()
                        .frame(width:180,height: 180)
                        .clipped()
                        .padding(.top,56)
                        .foregroundColor(.black)
                        
                }.sheet(isPresented: $imagePickerPresented,onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            }else if let image=postImage{
                HStack(alignment:.top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:96,height: 96)
                        .clipped()
                    //TextField("Enter your caption...", text: $captionText)
                    TextArea(placeholder: "Enter your caption...", text: $captionText)
                        .frame(height: 200)
                }.padding()
                
                HStack(spacing:16){
                    Button {
                        captionText=""
                        postImage=nil
                        }
                         label: {
                        Text("Cancel")
                            .font(.system(size: 16,weight: .semibold))
                            .frame(width: 172,height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        if let image=selectedImage{
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText=""
                                postImage=nil
                                tabIndex=0
                            }
                        }
                        
                    } label: {
                        Text("Share")
                            .font(.system(size: 16,weight: .semibold))
                            .frame(width: 172,height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }

                }.padding()
                
                
            }

            Spacer()
        }

    }
}

extension UploadPostView{
    func loadImage(){
        guard let selectedImage=selectedImage else {return}
        postImage=Image(uiImage: selectedImage)
    }
}

