//
//  LoginformView.swift
//  Lince
//
//  Created by Leon Sanchez on 19/05/21.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LoginformView: View {
    
    @Binding var formShowing: Bool
    
    @State private var email: String = ""
    @State private var senha: String = ""
    @State private var errorMessage: String?
    
    let neon1 = Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1))
    let neon2 = Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1))
    let neon3 = Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1))
    
    
    var body: some View {
        
        
        
        VStack(spacing: 40){
            
            HStack{
                Spacer()
                VStack(spacing:15){
                    Circle()
                        .foregroundColor(neon1)
                        .frame(width: 160, height: 160)
                        .overlay(
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(.systemBackground))
                        )
                    RoundedRectangle(cornerRadius: 20.0)
                        .frame(width: 190, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }.padding(.top, 50)
            
            
            Form{
                
                
                Section{
                    TextField("E-mail", text: $email)
                    SecureField("password", text: $senha)
                }
                
                if errorMessage != nil{
                    Section{
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    
                    signIn()
                    
                }, label: {
                    
                    HStack {
                        Spacer()
                        Text("Entrar")
                            .foregroundColor(neon1)
                        Spacer()
                    }
                })
            }
            .navigationBarTitle("Entre")
            .foregroundColor(neon1)
            .accentColor(neon1)
            
        }.preferredColorScheme(.dark)
        
        
        
    }
    
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: senha) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    //dismiss sheet
                    formShowing = false
                }
                else {
                    
                    errorMessage = error!.localizedDescription
                    
                }
            }
        }
    }
}

struct LoginformView_Previews: PreviewProvider {
    static var previews: some View {
        LoginformView(formShowing: Binding.constant(true)).preferredColorScheme(.dark)
    }
}
