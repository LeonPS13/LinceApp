//
//  NewsView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        
        let publis: [Color] = [.blue, .green, .orange, .pink]
        
        VStack {
            
            CabecalhoView(titulo: "News")
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(publis, id: \.self) { i in
                        NewsBlock(publi: i)
                    }
                    
                }
                
            }
            .background(Color(.white))
            
        }.ignoresSafeArea()
        
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
