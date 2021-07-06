//
//  PhotoChangeView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct PhotoChangeView: View {
    
    let colors: [Color] = [.blue, .green, .red, .purple,.yellow]
    
    var body: some View {
        
        VStack(alignment:.center){
            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                    .frame(width: 170, height: 170)
                    .clipped()
                Image(systemName: "face.smiling")
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
                    .padding(25)
            }.frame(width: 180, height: 180)
            
            HStack {
                Image(systemName: "camera")
                Text("Escolher foto")
                    .bold()
                    .font(.title)
                Image(systemName: "camera")
            }
        }
        
    }
}

struct PhotoChangeView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoChangeView()
    }
}
