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
                print("Signed in")
                self.addLiveUser()
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
    
    func addLiveUser() {
        db.collection("Live Users").document("User").setData(["Name": "Jack"])
    }
    
    func startListensingForUsers() {
        db.collection("Live Users").doc("User").onSnapshot((doc) => {
            print(doc.data())
        })
    }
}
