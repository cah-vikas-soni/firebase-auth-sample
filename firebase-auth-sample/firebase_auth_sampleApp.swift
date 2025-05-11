//
//  firebase_auth_sampleApp.swift
//  firebase-auth-sample
//
//  Created by Vikas Soni on 10/05/25.
//

import SwiftUI

import Firebase

@main
struct MyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
