//
//  MarketplaceView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct MarketplaceView: View {
    
    @State var loja: Color = .blue
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            
            HStack{
                ZStack {
                    Circle()
                        .foregroundColor(loja)
                        .frame(height: 100)
                    Image(systemName: "bag")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .opacity(0.3)
                        .padding()
                }
                
                Spacer()
                
                Text("Nome da loja")
                    
                    .foregroundColor(.black)
                    .font(.title)
                
                
            }.padding()
            
        }.padding()
        
    }
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
    }
}
