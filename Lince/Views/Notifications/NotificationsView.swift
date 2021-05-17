//
//  NotificationsView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct NotificationsView: View {
    
    let notifications: [Color] = [.blue, .green, .orange, .pink, .red, .purple, .yellow, .black]
    
    var body: some View {
   
        VStack {
            
            CabecalhoView(titulo: "Notificações")
            
            ScrollView {
                
                LazyVStack(spacing:0) {
                    
                    ForEach(notifications, id: \.self) { i in
                        NotificationBlock(notification: i)
                    }
                    
                }
                
            }
            .background(Color(.white))
            
        }.ignoresSafeArea()
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
