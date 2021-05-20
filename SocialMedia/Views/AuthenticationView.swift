//
//  AuthenticationView.swift
//  SocialMedia
//
//  Created by Finnis on 20/05/2021.
//

import SwiftUI

struct AuthenticationView: View {
    
    // Firebase authenication manager
    @StateObject var authenicationManager = AuthenticationManager()
    
    var body: some View {
        if authenicationManager.signedIn {
            SignOutView(authenicationManager: authenicationManager)
        } else {
            SignInView(authenicationManager: authenicationManager)
        }
    }
}

