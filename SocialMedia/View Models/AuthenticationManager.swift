//
//  AuthenticationManager.swift
//  SocialMedia
//
//  Created by Finnis on 19/05/2021.
//

import Foundation
import FirebaseAuth

class AuthenticationManager: ObservableObject {
    
    let auth = Auth.auth()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print("Error signing in")
                return
            }
            print("User is signed in")
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print("Error signing up")
                return
            }
            print("User is signed up")
        }
    }
}
