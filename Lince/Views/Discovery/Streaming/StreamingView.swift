//
//  StreamingView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct StreamingView: View {
    
    @State var stream: Color = .blue
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            
            HStack{
                ZStack {
                    Circle()
                        .foregroundColor(stream)
                        .frame(height: 100)
                    Image(systemName: "video")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .opacity(0.3)
                        .padding()
                }
                
                Spacer()
                
                Text("Nome do Stream")
                    
                    .foregroundColor(.black)
                    .font(.title)
                
                
            }.padding()
            
        }.padding()
        
    }
}

struct StreamingView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingView()
    }
}
