//
//  WordListen.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 10/1/22.
//

import SwiftUI

struct WordListen: View {
    @State var isPlaying = false

    var body: some View {
        LevelCell {
            Spacer()
            Circle()
                .fill(.gray)
                .frame(width: 250)
            Spacer()
            VStack(spacing: 0) {
                ForEach(1 ... 4, id: \.self) { index in
                    Divider()
                    Button(action: {}) {
                        Text("Вариант \(index)")
                            .padding()
                            .tint(.primary)
                            .frame(width: 400)
                            .clipped()
                    }
                }
            }
        }
    }
}

struct WordListen_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WordListen()
        }
        .background(Color("BackgroundColor"))
        .preferredColorScheme(.dark)
    }
}
