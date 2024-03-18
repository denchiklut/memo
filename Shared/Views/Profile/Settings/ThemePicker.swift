//
//  ThemePicker.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/15/24.
//

import SwiftUI

struct ThemePicker: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("color_mode") var colorMode: ColorMode = .system
    @AppStorage("accent_color") var accentColor: String = "pink"

    let colors: [String] = ["red", "orange", "yellow", "green", "mint", "teal", "cyan", "blue", "indigo", "purple", "pink"].reversed()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Appearance")
                .padding(.horizontal)
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(spacing: 14) {
                HStack(spacing: 18) {
                    ForEach(ColorMode.allCases, id: \.rawValue) { mode in
                        VStack {
                            Button(action: {
                                colorMode = mode
                            }) {
                                Rectangle()
                                    .fill(.clear)
                                    .padding(.all)
                                    .background(Image(mode.image).resizable().scaledToFill())
                                    .frame(height: 74)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 15)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(colorMode == mode ? Color.accentColor : .clear, lineWidth: 2)
                                            .padding(.all, 1)
                                    }
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(colorMode == mode ? Color("PaperColor") : .clear, lineWidth: 1)
                                            .padding(.all, 2)
                                    }
                            }

                            Text(mode.rawValue)
                                .font(.subheadline)
                                .foregroundColor(colorMode == mode ? Color.accentColor : .primary)
                        }
                    }
                }

                Divider()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
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
            .padding()
            .background(Color("PaperColor"))
            .border(width: 0.4, edges: [.top, .bottom], color: Color("BorderColor"))
        }
    }
}

#Preview {
    ThemePicker()
        .preferredColorScheme(.dark)
}
