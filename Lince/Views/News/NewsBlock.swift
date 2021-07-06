//
//  NewsBlock.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct NewsBlock: View {
    
    @State var publi: Color = .blue
    
    var body: some View {
          
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(.darkGray))
                .cornerRadius(18)
                .shadow(color: .black, radius: 1)
            
            
            VStack(alignment: .leading) {
                
                Text("Titulo")
                    .font(.largeTitle)
                    
                ZStack {
                    Rectangle()
                        .foregroundColor(publi)
                        .frame(height: 170)
                        .cornerRadius(16)
                    Image(systemName: "newspaper")
                        .resizable()
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(height: 110)
                }
                Text("Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto")
                    
                Text("#tag #tag #tag #tag")
                    
                
                
            }.padding(.all, 20)
            
        }.padding()
        
    }
    
}


struct NewsBlock_Previews: PreviewProvider {
    static var previews: some View {
        NewsBlock()
    }
}
