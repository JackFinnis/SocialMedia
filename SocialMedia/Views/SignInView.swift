//
//  SignInView.swift
//  SocialMedia
//
//  Created by Finnis on 19/05/2021.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var authenicationManager: AuthenticationManager
    
    // Show sign up view
    @State var isShowingSignUpView: Bool = false
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var errorMessage: String = ""
    var errorMessageIsPresented: Bool {
        if errorMessage.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                    if errorMessageIsPresented {
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.systemRed))
                    }
                    Button("Sign In") {
                        signIn()
                    }
                }
                Button("Create Account") {
                    isShowingSignUpView = true
                }
                .sheet(isPresented: $isShowingSignUpView) {
                    SignUpView(authenicationManager: authenicationManager, isShowingSignUpView: $isShowingSignUpView)
                }
            }
            .navigationTitle("Sign In")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func signIn() {
        authenicationManager.signIn(email: email, password: password) { error in
            if error != nil {
                print(error!)
                errorMessage = "Error signing in"
            } else {
                errorMessage = ""
            }
        }
    }
}
