//
//  FeedView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct FeedView: View {
    
    let publis: [Color] = [.blue, .green, .orange, .pink]
    
    var body: some View {
        
        VStack(spacing:0){
            
            CabecalhoView(titulo: "Feed")
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(publis, id: \.self) { i in
                        publiBlock(publi: i)
                    }
                    
                }
                
 
            }
            .background(Color(.white))
            
        }
        .ignoresSafeArea()
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .preferredColorScheme(.dark)
    }
}
