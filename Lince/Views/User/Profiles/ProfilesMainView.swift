//
//  ProfilesMainView.swift
//  Lince
//
//  Created by Leon Sanchez on 24/05/21.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ProfilesMainView: View {
    
    @EnvironmentObject var model: UserModel
    
    @State private var createProfileFormShowing: Bool = false
    
    
    var body: some View {
        
        //let perfis = model.perfis
        
        VStack{
            
            HStack {
                
                Text("Escolha seu perfil")
                    .bold()
                    .font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    
                    createProfileFormShowing = true
                    
                }, label: {
                    
                    Image(systemName: "plus.square.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                    
                    
                }).sheet(isPresented: $createProfileFormShowing, content: {
                    CreateProfileForm(formShowing: $createProfileFormShowing)
                })
                
            }.padding(.horizontal)
            
            Divider()

            EmptyProfile()
            
            Spacer()
            
            Button(action: {
                
                try! Auth.auth().signOut()
                model.checkLogin()
                
            }, label: {
                Text("Sair")
                    .foregroundColor(.red)
                    .bold()
                    .font(.title)
                    .padding(.bottom)
            })
            
        }
        
        
    }
    
}

struct ProfilesMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesMainView()
    }
}
