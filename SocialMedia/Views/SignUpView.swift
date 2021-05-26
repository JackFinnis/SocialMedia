//
//  SignUpView.swift
//  SocialMedia
//
//  Created by Finnis on 19/05/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var authenicationManager: AuthenticationManager
    @Binding var isShowingSignUpView: Bool
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
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
                        .textContentType(.newPassword)
                        .disableAutocorrection(true)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textContentType(.newPassword)
                        .disableAutocorrection(true)
                    if errorMessageIsPresented {
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.systemRed))
                    }
                    Button("Sign Up") {
                        signUp()
                    }
                }
            }
            .navigationTitle("Sign Up")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func signUp() {
        if password == "" {
            errorMessage = "Please enter a password"
        } else if confirmPassword == "" {
            errorMessage = "Please confirm your password"
        } else if password != confirmPassword {
            errorMessage = "Please enter the same password"
        } else {
            authenicationManager.signUp(email: email, password: password) { error in
                if error != nil {
                    print(error!)
                    errorMessage = "Error signing up"
                } else {
                    isShowingSignUpView = false
                    errorMessage = ""
                }
            }
        }
    }
}
