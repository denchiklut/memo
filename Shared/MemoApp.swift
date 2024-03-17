//
//  MemoApp.swift
//  Shared
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

@main
struct MemoApp: App {
    @AppStorage("color_mode") private var colorMode: ColorMode = .system

    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(colorMode.scheme)
        }
    }
}
