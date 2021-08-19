//
//  UserListView.swift
//  SocialMedia
//
//  Created by Finnis on 26/05/2021.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var authenicationManager: AuthenticationManager
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @State var searchText: String = ""
    
    var filteredUsers: [User] {
        firestoreManager.allUsers.filter {
            self.searchText.isEmpty ? true : ($0.email.contains(self.searchText))
        }
    }
    
    var body: some View {
        NavigationView {
            SearchBar(searchText: $searchText)
            List {
                ForEach(filteredUsers, id: \.self) { user in
                    NavigationLink(destination: Text(user.email), label: {
                        Text(user.email)
                    })
                }
            }
            .navigationTitle("Messages")
            .toolbar {
                ToolbarItem {
                    Button("Sign Out") {
                        authenicationManager.signOut()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
