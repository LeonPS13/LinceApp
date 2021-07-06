//
//  DiscoveryView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct DiscoveryView: View {
    
    let neon1 = Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1))
    let neon2 = Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1))
    let neon3 = Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1))
    
    @State var ViewType: Int = 0
    
    let notifications: [Color] = [.blue, .green, .orange, .pink, .red, .purple, .yellow, .black]
    
    var body: some View {
        
        
        VStack {
            
            CabecalhoView(titulo: "Descubra")
            
            Picker(selection: $ViewType, label: Text("Picker"), content: {
                Text("Comunidades").tag(1)
                Text("Streaming").tag(2)
                Text("MarketPlace").tag(3)
                
            })
            .pickerStyle(SegmentedPickerStyle())
            .frame(height: 60)
            
            Divider()
            
            ScrollView{
                
                if ViewType == 1 {
                    
                    VStack(alignment: .leading){
                        
                        Text("Recomendados")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(neon1)
                        
                        ComunityFeaturedView()
                        
                        Divider()
                        
                        Text("Suas comunidades")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(neon1)
                        
                        ForEach(notifications, id: \.self) { i in
                            ComunityView(comunidade: i)
                        }
                        
                    }.padding(5)
                    
                }
                else if ViewType == 2 {
                    
                    VStack(alignment: .leading){
                        
                        Text("Recomendados")
                            .foregroundColor(neon1)
                            .bold()
                            .font(.largeTitle)
                        
                        StreamingFeaturedView()
                        
                        Divider()
                        
                        Text("Suas streams")
                            .foregroundColor(neon1)
                            .bold()
                            .font(.largeTitle)
                        
                        ForEach(notifications, id: \.self) { i in
                            StreamingView(stream: i)
                        }
                        
                    }.padding(5)
                    
                }
                else if ViewType == 3 {
                    
                    VStack(alignment: .leading){
                        
                        Text("Recomendados")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(neon1)
                        
                        MarketplaceFeaturedView()
                        
                        Divider()
                        
                        Text("Suas lojas")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(neon1)
                        
                        ForEach(notifications, id: \.self) { i in
                            MarketplaceView(loja: i)
                        }
                        
                    }.padding(5)
                }
                else {
                    
                    VStack(spacing: 30){
                        
                        Image(systemName: "swift")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(neon1)
                        
                        
                        Text("Explore !")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(neon1)
                        
                    }.padding(.vertical)
                }
            }
            
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        
        
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
