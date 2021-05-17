//
//  MainView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
            
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
            
        }
        .background(Color(.white))
        .ignoresSafeArea()
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
