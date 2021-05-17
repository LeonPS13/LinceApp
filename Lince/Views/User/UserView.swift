//
//  UserView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct UserView: View {
    
    let colors: [Color] = [.blue, .green, .red, .purple,.yellow]
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment:.leading){
                
                Spacer()
                
                HStack{
                    
                    NavigationLink(
                        destination: PhotoChangeView(),
                        label: {
                            ZStack {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 130, height: 130)
                                    .clipped()
                                Image(systemName: "face.smiling")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .scaledToFit()
                                    .padding(25)
                            }.frame(width: 140, height: 140)
                        })
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing:5){
                        Text("@NomeDoAtleta")
                            .bold()
                            .font(.title3)
                        
                        HStack {
                            VStack {
                                Text("Seguidores")
                                    .bold()
                                Text("9999")
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("Seguidos")
                                    .bold()
                                Text("9999")
                            }
                            
                        }
                        .font(.system(size: 14))
                        Text("#patrocionio #patrocionio #patrocionio #patrocionio ")
                            .font(.system(size: 14))
                    }
                    
                }
                .padding(.horizontal,5)
                .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    Text("Biografia")
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                    Image(systemName: "pencil")
                        .foregroundColor(.black)
                }
                Text("Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio ")
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                
                
                
                VStack(alignment: .leading){
                    
                    NavigationLink(
                        destination: CalendarView(),
                        label: {
                            Text("Calendário")
                                .bold()
                                .font(.title)
                                .padding(.bottom)
                        })
                    
                    NavigationLink(
                        destination: DesafiosView(),
                        label: {
                            Text("Desafios")
                                .bold()
                                .font(.title)
                                .padding(.bottom)
                        })
                    NavigationLink(
                        destination: ContractsView(),
                        label: {
                            Text("Contratos")
                                .bold()
                                .font(.title)
                                .padding(.bottom)
                        })
                    
                    NavigationLink(
                        destination: ConfigView(),
                        label: {
                            Text("Configurações")
                                .bold()
                                .font(.title)
                                .padding(.bottom)
                        })
                }
                .foregroundColor(.black)
                
                Spacer()
                
                
                
            }
            .padding()
            .background(Color(.white))
            .ignoresSafeArea()
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
