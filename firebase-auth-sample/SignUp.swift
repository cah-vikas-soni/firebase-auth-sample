//
//  SignUp.swift
//  firebase-auth-sample
//
//  Created by Vikas Soni on 10/05/25.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Email Field
            TextField("Enter your email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            // Password Field
            SecureField("Enter your password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            // Error Message
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
            
            if isLoading {
                LoadingView()
            }
            
            // Sign-Up Button
            Button(action: {
                signUpUser(email: email, password: password)
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
    
    func signUpUser(email: String, password: String) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                print("Signup successful!")
            }
        }
    }
}
