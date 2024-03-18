//
//  Chip.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import SwiftUI

struct ChipToggleStyle: ToggleStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .font(.system(size: 16))
                .padding(.vertical, 4)
                .padding(.horizontal, 20)
                .foregroundColor(configuration.isOn ? .white : color)
                .background(configuration.isOn ? color : .clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color, lineWidth: configuration.isOn ? 0 : 1)
                )
        }
        .cornerRadius(20)
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension ToggleStyle where Self == ChipToggleStyle {
    static var chip: ChipToggleStyle {
        ChipToggleStyle(color: .accentColor)
    }
}

#Preview {
    HStack {
        Toggle(isOn: .constant(true)) {
            Text("Label")
        }
        .toggleStyle(.chip)

        Toggle(isOn: .constant(false)) {
            Text("Label")
        }
        .toggleStyle(.chip)
        .disabled(true)
        .shakeable(true)
    }
}
