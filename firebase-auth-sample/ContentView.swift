//
//  ContentView.swift
//  firebase-auth-sample
//
//  Created by Vikas Soni on 10/05/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isAuthenticated = false

    var body: some View {
        if isAuthenticated {
            HomeView(isAuthenticated: $isAuthenticated)
        } else {
            LoginView(isAuthenticated: $isAuthenticated)
        }
    }

    init() {
        checkUserStatus()
    }

    func checkUserStatus() {
        if Auth.auth().currentUser != nil {
            isAuthenticated = true
        }
    }
}
