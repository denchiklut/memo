//
//  MemoApp.swift
//  Shared
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI
//import Firebase

@main
struct MemoApp: App {
    init() {
//        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
