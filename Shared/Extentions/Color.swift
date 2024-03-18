//
//  Color.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/17/24.
//

import SwiftUI

extension Color {
    static func from(name name: String) -> Color {
        switch name {
            case "red": return .red
            case "orange": return .orange
            case "yellow": return .yellow
            case "green": return .green
            case "mint": return .mint
            case "teal": return .teal
            case "cyan": return .cyan
            case "blue": return .blue
            case "indigo": return .indigo
            case "purple": return .purple
            case "pink": return .pink
            default: return Color(name)
        }
    }
}
