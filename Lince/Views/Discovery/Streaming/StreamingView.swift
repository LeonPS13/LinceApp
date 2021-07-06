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
                .foregroundColor(Color(.darkGray))
                .cornerRadius(18)
                .frame(height: 140)
            
            HStack{
                ZStack {
                    Circle()
                        .foregroundColor(stream)
                        .frame(width:100, height: 100)
                    Image(systemName: "video")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .opacity(0.5)
                        .padding()
                }.padding(.leading,10)
                
                Spacer()
                
                Text("Nome do stream")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 10)
                
                
            }.padding()
            
        }.padding()
        
    }
}

struct StreamingView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingView()
    }
}
