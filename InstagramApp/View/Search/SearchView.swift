//
//  SearchView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText=""
    @State var inSearchMode=false
    @ObservedObject var viewModel=SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText,isEditing: $inSearchMode)
                .padding()
            ZStack{
                if inSearchMode{
                    UserListView(viewModel: viewModel, searchText: $searchText)
                }else{
                    PostgridView(config: .explore)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
