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
                .if(configuration.isOn) { $0.foregroundColor(.white) }
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(.foreground)
                    .opacity(configuration.isOn ? 1 : 0)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.foreground, lineWidth: 1)
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
    struct ChipDemo: View {
        @State var isSelected = true

        var body: some View {
            HStack {
                Toggle(isOn: $isSelected) {
                    Text("Label")
                }
                .toggleStyle(.chip)
                .foregroundStyle(.pink)

                Toggle(isOn: .constant(false)) {
                    Text("Label")
                }
                .toggleStyle(.chip)
                .disabled(true)
                .shakeable(true)
            }
        }
    }

    return ChipDemo()
}
