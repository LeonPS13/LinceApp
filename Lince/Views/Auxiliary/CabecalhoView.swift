//
//  CabecalhoView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct CabecalhoView: View {
    
    var titulo = "titulo"
    
    var body: some View {
        
        ZStack(alignment:.leading){
            Rectangle()
                .frame(height:90)
                .foregroundColor(.white)
                
            Text(titulo)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
                .padding([.top, .leading], 25)
        }.ignoresSafeArea()
        
    }
}

struct CabecalhoView_Previews: PreviewProvider {
    static var previews: some View {
        CabecalhoView()
    }
}
