//
//  NewsView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        
        let publis: [Color] = [Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1)), Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1)), Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1)),Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1)), Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1)), Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1))]
        
        VStack {
            
            CabecalhoView(titulo: "News")
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(publis, id: \.self) { i in
                        NewsBlock(publi: i)
                    }
                    
                }
                
            }
            
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
