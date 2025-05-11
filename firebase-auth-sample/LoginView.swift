//
//  LoginView.swift
//  firebase-auth-sample
//
//  Created by Vikas Soni on 10/05/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var isAuthenticated: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                
                SecureField("Enter your password", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                if isLoading {
                    LoadingView()
                }

                Button(action: {
                    loginUser(email: email, password: password)
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // Signup Navigation Link inside NavigationView
                NavigationLink("Don't have an account? Sign Up", destination: SignupView())
                    .padding(.top, 10)
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
    
    func loginUser(email: String, password: String) {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            isLoading = false
            if error == nil {
                isAuthenticated = true // Navigate to HomeView
            } else {
                errorMessage = error?.localizedDescription ?? "Login Failed"
            }
        }
    }
}
