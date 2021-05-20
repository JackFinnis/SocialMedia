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
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
