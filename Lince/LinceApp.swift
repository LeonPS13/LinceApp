//
//  LinceApp.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import SwiftUI
import Firebase

@main
struct LinceApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(UserModel())
                .environment(\.colorScheme, .dark)
        }
    }
}
