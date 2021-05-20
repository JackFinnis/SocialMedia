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
    
    @Published var signedIn: Bool = false
    
    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Error signing in")
                completion(error)
            } else {
                print("Signed in")
                self.signedIn = true
                completion(nil)
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Error?) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Error signing up")
                completion(error)
            } else {
                print("Signed up")
                
                // Then automatically sign in
                self.signIn(email: email, password: password) { error in
                    if error != nil {
                        print("Error automatically signing in")
                    } else {
                        print("Automatically signed in")
                    }
                }
                completion(nil)
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch {
            print("Error signing out")
            return
        }
        print("Signed out")
        signedIn = false
    }
}
