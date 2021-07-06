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
                .cornerRadius(18)
                .shadow(color: .black, radius: 1)
                .foregroundColor(Color(.darkGray))
                
                
            VStack(alignment: .leading) {
                
                Text("Titulo")
                    .font(.largeTitle)

                Rectangle()
                    .foregroundColor(publi)
                    .frame(height: 170)
                    .cornerRadius(16)
                
                Text("Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto")

                Text("#tag #tag #tag #tag")


            }
            .padding(.all, 20)
            
        }
        .padding()
        
    }
}

struct publiBlock_Previews: PreviewProvider {
    static var previews: some View {
        publiBlock()
    }
}
