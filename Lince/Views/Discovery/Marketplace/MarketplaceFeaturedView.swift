//
//  MarketplaceFeaturedView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct MarketplaceFeaturedView: View {
    let neon1 = Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1))
    let neon2 = Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1))
    let neon3 = Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1))
    
    var body: some View {
        
        VStack{
            HStack{
                
                ZStack {
                    Rectangle()
                        .foregroundColor(neon1)
                        .cornerRadius(12)
                        .frame(height:130)
                        .overlay(
                            Image(systemName: "tag")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding()
                                .overlay(
                                    Text("1")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                )
                        ).shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(neon2)
                        .cornerRadius(12)
                        .frame(height:130)
                        .overlay(
                            Image(systemName: "tag")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding()
                                .overlay(
                                    Text("2")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                )
                        ).shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                    
                }
                
            }
            HStack{
                
                ZStack {
                    Rectangle()
                        .foregroundColor(neon3)
                        .cornerRadius(12)
                        .frame(height:130)
                        .overlay(
                            Image(systemName: "tag")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding()
                                .overlay(
                                    Text("3")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                )
                        ).shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(neon1)
                        .cornerRadius(12)
                        .frame(height:130)
                        .overlay(
                            Image(systemName: "tag")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding()
                                .overlay(
                                    Text("4")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                )
                        ).shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                }
                
            }
        }.padding()
        
    }
}

struct MarketplaceFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceFeaturedView()
    }
}
