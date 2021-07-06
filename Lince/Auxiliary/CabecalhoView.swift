//
//  CabecalhoView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct CabecalhoView: View {
    
    var titulo = "titulo"
    
    let neon1 = Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1))
    
    var body: some View {
        
        ZStack(alignment:.leading){
            Rectangle()
                .frame(height:90)
                .foregroundColor(.black)
                
            Text(titulo)
                .font(.largeTitle)
                .bold()
                .foregroundColor(neon1)
                .padding([.top, .leading], 25)
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        
    }
}

struct CabecalhoView_Previews: PreviewProvider {
    static var previews: some View {
        CabecalhoView()
    }
}
