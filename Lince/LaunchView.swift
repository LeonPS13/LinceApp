//
//  LaunchView.swift
//  Lince
//
//  Created by Leon Sanchez on 19/05/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LaunchView: View {
    
    @EnvironmentObject var model: UserModel
    
    let neon1 = Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1))
    let neon2 = Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1))
    let neon3 = Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1))
    
    @State var loginFormShowing = false
    @State var createFormShowing = false
    
    var body: some View {
        
        if !model.loggedIn {
            
            VStack(spacing:0){
                
                Spacer()
                
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
                }
                
                Spacer()
                
                VStack{
                    //sign in button
                    Button {
                        loginFormShowing = true
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(height:40)
                                .foregroundColor(neon1)
                                .shadow(radius: 2)
                                .cornerRadius(8)
                            Text("Entrar")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                    }
                    .sheet(isPresented: $loginFormShowing, onDismiss: checkLogin, content: {
                        LoginformView(formShowing: $loginFormShowing)
                    })
                    
                    //create account button
                    Button{
                        createFormShowing = true
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(height:40)
                                .foregroundColor(neon1)
                                .shadow(radius: 2)
                                .cornerRadius(8)
                            Text("Criar conta")
                                .bold()
                                .font(.title3)
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                    }
                    .sheet(isPresented: $createFormShowing,
                           onDismiss: checkLogin){
                        
                        CreateAccForm(formShowing: $createFormShowing)
                    }
                }
                
                Spacer()
            }
            .preferredColorScheme(.dark)
            .onAppear{
                checkLogin()
            }
            
            
        }
        
        else {
            MainView()
        }
    }
    
    func checkLogin() {
        model.loggedIn = Auth.auth().currentUser == nil ? false : true
    }
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
