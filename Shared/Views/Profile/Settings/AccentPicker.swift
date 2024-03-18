//
//  AccentPicker.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/18/24.
//

import SwiftUI

struct AccentPicker: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("accent_color") var accentColor: String = "pink"

    let colors: [String] = ["red", "orange", "yellow", "green", "mint", "teal", "cyan", "blue", "indigo", "purple", "pink"].reversed()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 18) {
                Button(action: {}) {
                    Image(colorScheme == .dark ? "color-picker-dark" : "color-picker-light")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 36)
                }

                ForEach(colors, id: \.self) { color in
                    Button(action: {
                        accentColor = color
                    }) {
                        Circle()
                            .fill(Color.from(name: color))
                            .frame(width: 36, height: 36)
                            .overlay(
                                Circle()
                                    .stroke(Color("PaperColor"), lineWidth: accentColor == color ? 2 : 0)
                                    .padding(.all, 3)
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AccentPicker()
}
