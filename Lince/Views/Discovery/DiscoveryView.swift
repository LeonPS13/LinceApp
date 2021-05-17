//
//  DiscoveryView.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI

struct DiscoveryView: View {
    
    @State var ViewType: Int = 0
    
    let notifications: [Color] = [.blue, .green, .orange, .pink, .red, .purple, .yellow, .black]
    
    var body: some View {
        
        
        VStack {
            
            Rectangle()
                .frame(height: 40)
                .foregroundColor(.white)
            
            Picker(selection: $ViewType, label: Text("Picker"), content: {
                Text("Comunidades").bold().tag(1)
                Text("Streaming").bold().tag(2)
                Text("MarketPlace").bold().tag(3)
                
            })
            .pickerStyle(SegmentedPickerStyle())
            .font(.title)
            .frame(height: 60)
            .foregroundColor(.black)
            
            Divider()
            
            ScrollView{
                
                if ViewType == 1 {
                    
                    VStack(alignment: .leading){
                        
                        Text("Recomendados")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                        ComunityFeaturedView()
                        
                        Divider()
                        
                        Text("Suas comunidades")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                        ForEach(notifications, id: \.self) { i in
                            ComunityView(comunidade: i)
                        }
                        
                    }.padding(5)
                    
                }
                else if ViewType == 2 {
                    
                    VStack(alignment: .leading){
                        
                        Text("Recomendados")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                        StreamingFeaturedView()
                        
                        Divider()
                        
                        Text("Suas streams")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
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
                            .foregroundColor(.black)
                        
                        MarketplaceFeaturedView()
                        
                        Divider()
                        
                        Text("Suas lojas")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                        ForEach(notifications, id: \.self) { i in
                            MarketplaceView(loja: i)
                        }
                        
                    }.padding(5)
                }
                else {
                    
                    Spacer()
                    
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("Explore !")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            }
            
        }
        .foregroundColor(.black)
        .background(Color(.white))
        .ignoresSafeArea()
        
        
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
