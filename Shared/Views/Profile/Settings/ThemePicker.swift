//
//  ThemePicker.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/15/24.
//

import SwiftUI

struct ThemePicker: View {
    @AppStorage("color_mode") var colorMode: ColorMode = .system

    var body: some View {
        VStack {
            HStack {
                ForEach(ColorMode.allCases, id: \.rawValue) { mode in
                    VStack {
                        Button(action: {
                            colorMode = mode
                        }) {
                            Rectangle()
                                .fill(.clear)
                                .padding(.all)
                                .background(Image(mode.image).resizable().scaledToFill())
                                .frame(height: 88)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(colorMode == mode ? .pink : .clear, lineWidth: 2)
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
                            .foregroundColor(colorMode == mode ? .pink : .primary)
                    }
                }
            }
        }
        .padding()
        .background(Color("PaperColor"))
        .border(width: 0.4, edges: [.top, .bottom], color: Color("BorderColor"))
    }
}

#Preview {
    ThemePicker()
        .preferredColorScheme(.dark)
}
