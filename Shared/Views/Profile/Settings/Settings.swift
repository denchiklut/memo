//
//  Settings.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

struct Settings: View {
    @State var isOpen = false

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    isOpen.toggle()
                }) {
                    Text("Study kanguage")
                    Spacer()
                    Text("English")
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("PaperColor"))
            .border(width: 0.4, edges: [.top, .bottom], color: Color("BorderColor"))
            .halfSheet(isPresented: $isOpen) {
                Language(isPromted: $isOpen)
            }

            VStack(spacing: 0) {
                ThemePicker()
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Settings()
        }
    }
}
