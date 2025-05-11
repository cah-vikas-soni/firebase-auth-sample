//
//  HomeView.swift
//  firebase-auth-sample
//
//  Created by Vikas Soni on 10/05/25.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Button(action: {
                logout()
            }) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false // Redirect to LoginView
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
}
