//
//  FirestoreManager.swift
//  SocialMedia
//
//  Created by Finnis on 26/05/2021.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    
    let db = Firestore.firestore()
    
    func addLiveUser() {
        db.collection("Live Users").document("User").setData(["Name": "Jack"])
    }
}
