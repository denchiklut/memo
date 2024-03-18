//
//  DarkModePicker.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/18/24.
//

import SwiftUI

struct DarkModePicker: View {
    @AppStorage("color_mode") var colorMode: ColorMode = .system

    var body: some View {
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
    }
}

#Preview {
    DarkModePicker()
        .padding()
}
