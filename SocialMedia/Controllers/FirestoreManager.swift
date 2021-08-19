//
//  FirestoreManager.swift
//  SocialMedia
//
//  Created by Finnis on 26/05/2021.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    @Published var userInfo: User = User(userID: "Loading...", active: false, email: "Loading...")
    @Published var allUsers: [User] = []
    
    init() {
        getUserInfo()
        getAllUserInfo()
    }
    
    func getUserInfo() {
        let user = auth.currentUser
        if user != nil {
            db.collection("Users").whereField("userID", isEqualTo: user!.uid).getDocuments() { (query, error) in
                if error != nil {
                    print("Error getting user info")
                } else {
                    print("Success getting user info")
                    for document in query!.documents {
                        let data = document.data()
                        let userID = data["userID"] as? String ?? ""
                        let active = data["active"] as? Bool ?? false
                        let email = data["email"] as? String ?? ""
                        self.userInfo = User(userID: userID, active: active, email: email)
                    }
                }
            }
        }
    }
    
    func getAllUserInfo() {
        db.collection("Users").getDocuments() { (query, error) in
            if error != nil {
                print("Error getting all user info")
            } else {
                print("Success getting all user info")
                for document in query!.documents {
                    let data = document.data()
                    let userID = data["userID"] as? String ?? ""
                    let active = data["active"] as? Bool ?? false
                    let email = data["email"] as? String ?? ""
                    self.allUsers.append(User(userID: userID, active: active, email: email))
                }
            }
        }
    }
}
