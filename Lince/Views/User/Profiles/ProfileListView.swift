//
//  ProfileListView.swift
//  Lince
//
//  Created by Leon Sanchez on 24/05/21.
//

import SwiftUI

struct ProfileListView: View {
    
    @EnvironmentObject var model: UserModel
    
    @State var perfis: [Perfil] = []
    
    var body: some View {
   
        List{
            
            ForEach(perfis, id:\.self) { prof in
                ProfileBlock(perfil: model.perfis[prof])
            }
            
        }
        
        
    }
    
}


struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
    }
}
