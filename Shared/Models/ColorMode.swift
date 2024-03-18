//
//  File.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/17/24.
//

import SwiftUI

enum ColorMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"

    var image: String {
        switch self {
        case .dark: return "dark"
        case .light: return "light"
        case .system: return "system"
        }
    }

    var scheme: ColorScheme? {
        switch self {
        case .dark: return .dark
        case .light: return .light
        case .system: return nil
        }
    }
}
