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

    // Set up Firebase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Authenication manager
    @StateObject var authenicationManager = AuthenticationManager()
    
    // Firestore manager
    @StateObject var firestoreManager = FirestoreManager()
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environmentObject(authenicationManager)
                .environmentObject(firestoreManager)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
