//
//  NotificationBlock.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct NotificationBlock: View {
    
    @State var notification: Color = .blue
    
    var body: some View {
       
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            
            HStack{
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.3)
                }
                Text("Text Text Text Text Text Text Text Text Text")
                    .foregroundColor(.black)
                Rectangle()
                    .foregroundColor(notification)
                    .cornerRadius(10)
                
            }.padding()
            
        }.padding()
        
    }
}

struct NotificationBlock_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBlock()
    }
}
