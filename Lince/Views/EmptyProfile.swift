//
//  EmptyProfile.swift
//  Lince
//
//  Created by Leon Sanchez on 24/05/21.
//

import SwiftUI

struct EmptyProfile: View {
    var body: some View {
        Text("Você ainda não possui um perfil! Crie o seu primeiro perfil.")
            .padding()
    }
}

struct EmptyProfile_Previews: PreviewProvider {
    static var previews: some View {
        EmptyProfile()
    }
}
