//
//  ProfileBlock.swift
//  Lince
//
//  Created by Leon Sanchez on 24/05/21.
//

import SwiftUI

struct ProfileBlock: View {
    
    var perfil: Perfil
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 50)
                .foregroundColor(.white)
                .shadow(radius: 2)
            
            HStack{
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 35, height: 35)
                        .padding()
                    Text("X")
                        .bold()
                        .foregroundColor(.white)
                }
                    
                
                VStack(alignment:.leading){
                    
                    Text(perfil.nomeSocial).bold()
                    Text(perfil.profType)
                    
                }.foregroundColor(.black)
                
                Spacer()
            }
        }.padding(2)
    }
}

struct ProfileBlock_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBlock(perfil: Perfil())
    }
}
