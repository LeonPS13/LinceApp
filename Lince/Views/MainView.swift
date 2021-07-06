//
//  MainView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        
        TabView {
            
            FeedView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                }
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "exclamationmark.circle")
                }
            
            DiscoveryView()
                .tabItem {
                    Image(systemName: "staroflife")
                }
            
            UserView()
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
        .preferredColorScheme(.dark)
        .background(Color.black)
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
