//
//  ContentView.swift
//  SocialMedia
//
//  Created by Finnis on 19/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authenicationManager = AuthenticationManager()
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            Button("Sign up") {
                authenicationManager.signUp(email: email, password: password)
            }
            Button("Sign in") {
                authenicationManager.signIn(email: email, password: password)
            }
        }
    }
}
