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
                .foregroundColor(Color(.darkGray))
                .cornerRadius(18)
                .frame(height: 140)
            
            HStack{
                ZStack {
                    Circle()
                        .foregroundColor(comunidade)
                        .frame(width:100, height: 100)
                    Image(systemName: "person.3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .opacity(0.5)
                        .padding()
                }.padding(.leading,10)
                
                Spacer()
                
                Text("Nome da Comunidade")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 10)
                
                
            }.padding()
            
        }.padding()
        
    }
}

struct ComunityView_Previews: PreviewProvider {
    static var previews: some View {
        ComunityView()
    }
}
