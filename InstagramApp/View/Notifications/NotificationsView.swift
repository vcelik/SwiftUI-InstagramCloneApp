//
//  NotificationsView.swift
//  InstagramApp
//
//  Created by Volkan Celik on 01/08/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @ObservedObject var viewModel=NotificationsViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing:20){
                ForEach(viewModel.notifications){notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
