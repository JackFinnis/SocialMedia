//
//  SignOutView.swift
//  SocialMedia
//
//  Created by Finnis on 20/05/2021.
//

import SwiftUI

struct SignOutView: View {
    
    @ObservedObject var authenicationManager: AuthenticationManager
    
    var body: some View {
        NavigationView {
            Form {
                Button("Sign Out") {
                    authenicationManager.signOut()
                }
            }
            .navigationTitle("Signed In")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
