//
//  AuthenticationManager.swift
//  SocialMedia
//
//  Created by Finnis on 19/05/2021.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthenticationManager: ObservableObject {
    
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    @Published var signedIn: Bool = false
    
    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Error signing in")
                completion(error)
            } else {
                print("Success signing in")
                self.signedIn = true
                self.setUserStatus(active: true)
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
                print("Success signing up")
                self.addUser(email: email)
                
                // Then automatically sign in
                self.signIn(email: email, password: password) { error in
                    if error != nil {
                        print("Error automatically signing in")
                    } else {
                        print("Success automatically signing in")
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
        print("Success signing out")
        signedIn = false
        setUserStatus(active: false)
    }
    
    func addUser(email: String) {
        let user = auth.currentUser
        if user != nil {
            db.collection("Users").addDocument(data: ["userID": user!.uid, "active": false, "email": email]) { error in
                if error != nil {
                    print("Error adding user")
                } else {
                    print("Success adding user")
                }
            }
        }
    }
    
    func setUserStatus(active: Bool) {
        let user = auth.currentUser
        if user != nil {
            db.collection("Users").whereField("userID", isEqualTo: user!.uid).setValue(active, forKey: "active")
        }
    }
}
