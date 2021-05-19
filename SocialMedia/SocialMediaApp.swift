//
//  SocialMediaApp.swift
//  SocialMedia
//
//  Created by Finnis on 19/05/2021.
//

import SwiftUI
import Firebase

@main
struct SocialMediaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
