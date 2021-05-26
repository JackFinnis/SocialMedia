//
//  AuthenticationView.swift
//  SocialMedia
//
//  Created by Finnis on 20/05/2021.
//

import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject var authenicationManager: AuthenticationManager
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        if authenicationManager.signedIn {
            UserListView()
        } else {
            SignInView()
        }
    }
}

