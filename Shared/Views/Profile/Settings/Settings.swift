//
//  Settings.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

struct Settings: View {
    @AppStorage("darkMode") var darkMode: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Toggle(isOn: $darkMode) {
                    Text("Dark mode")
                }
            }
            .padding()
            .background(Color("MenuColor"))
            .border(width: 0.4, edges: [.top, .bottom], color: Color("BorderColor"))
            
            ForEach(items, id: \.self) { item in
                HStack {
                    Text(item)
                        .padding(.vertical, 4)
                    Spacer()
                }
                .padding()
                .background(Color("MenuColor"))
                .border(width: 0.4, edges: [.bottom], color: Color("BorderColor"))
            }
        }
    }
}

let items = [
    "Востановить покупки",
    "Поддержать"
]

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
