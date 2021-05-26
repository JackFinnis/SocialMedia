//
//  UserListView.swift
//  SocialMedia
//
//  Created by Finnis on 26/05/2021.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var authenicationManager: AuthenticationManager
    
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
