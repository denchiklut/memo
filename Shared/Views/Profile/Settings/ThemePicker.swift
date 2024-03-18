//
//  ThemePicker.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/15/24.
//

import SwiftUI

struct ThemePicker: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Appearance")
                .padding(.horizontal)
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(spacing: 14) {
                DarkModePicker()
                Divider()
                AccentPicker()
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
