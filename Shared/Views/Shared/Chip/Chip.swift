//
//  Chip.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import SwiftUI

struct Chip: View {
    let label: String
    let color: Color
    @Binding var isChecked: Bool
    var action: ((Bool) -> Void)? = nil 

    var body: some View {
        Button(action: {
            isChecked.toggle()
            action?(isChecked)
        }) {
            Text(label)
                .font(.system(size: 16))
                .padding(.vertical, 4)
                .padding(.horizontal, 20)
                .foregroundColor(isChecked ? .white : color)
                .background(isChecked ? color : .clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color, lineWidth: isChecked ? 0 : 1)
                )
        }
        .cornerRadius(20)
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    Chip(label: "Hi there", color: .pink, isChecked: .constant(false))
        .foregroundColor(.red)
}
