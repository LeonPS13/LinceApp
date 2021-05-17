//
//  ComunityFeaturedView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct ComunityFeaturedView: View {
    
    var body: some View {
        
        VStack{
            HStack{
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .padding()
                    Text("1")
                        .bold()           .foregroundColor(.white)
                        .font(.title)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .cornerRadius(12)
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .padding()
                    Text("2")
                        .bold()           .foregroundColor(.white)
                        .font(.title)
                }
                
            }
            HStack{
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.green)
                        .cornerRadius(12)
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .padding()
                    Text("3")
                        .bold()           .foregroundColor(.white)
                        .font(.title)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.orange)
                        .cornerRadius(12)
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .padding()
                    Text("4")
                        .bold()           .foregroundColor(.white)
                        .font(.title)
                }
                
            }
        }.padding(6)
        
    }
}

struct ComunityFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        ComunityFeaturedView()
    }
}
