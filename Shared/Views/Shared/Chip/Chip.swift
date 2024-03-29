//
//  Chip.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import SwiftUI

struct ChipToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .font(.system(size: 16))
                .padding(.vertical, 4)
                .padding(.horizontal, 20)
                .foregroundColor(configuration.isOn ? .white : nil)
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(.tint)
                    .opacity(configuration.isOn ? 1 : 0)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.tint, lineWidth: 1)
                )
        }
    }
}

extension ToggleStyle where Self == ChipToggleStyle {
    static var chip: ChipToggleStyle {
        ChipToggleStyle()
    }
}

#Preview {
    HStack {
        Toggle(isOn: .constant(true)) {
            Text("Label")
        }
        .toggleStyle(.chip)
        .tint(.pink)

        Toggle(isOn: .constant(false)) {
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
