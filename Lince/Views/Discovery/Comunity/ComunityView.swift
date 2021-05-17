//
//  ComunityView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct ComunityView: View {
    
    @State var comunidade: Color = .blue
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            
            HStack{
                ZStack {
                    Circle()
                        .foregroundColor(comunidade)
                        .frame(height: 100)
                    Image(systemName: "person.3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .opacity(0.3)
                        .padding()
                }
                
                Spacer()
                
                Text("Nome da Comunidade")
                    
                    .foregroundColor(.black)
                    .font(.title)
                
                
            }.padding()
            
        }.padding()
        
    }
}

struct ComunityView_Previews: PreviewProvider {
    static var previews: some View {
        ComunityView()
    }
}
