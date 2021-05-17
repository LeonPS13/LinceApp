//
//  publiBlock.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct publiBlock: View {
    
    @State var publi: Color = .blue
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(14)
                .shadow(color: .black, radius: 1)
                
                
            VStack(alignment: .leading) {
                
                Text("Titulo")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Rectangle()
                    .foregroundColor(publi)
                    .frame(height: 170)
                Text("Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto")
                    .foregroundColor(.black)
                Text("#tag #tag #tag #tag")
                    .foregroundColor(.black)

            }.padding(.all, 20)
            
        }.padding()
        
    }
}

struct publiBlock_Previews: PreviewProvider {
    static var previews: some View {
        publiBlock()
    }
}
