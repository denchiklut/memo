//
//  TranslateWord.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 10/1/22.
//

import SwiftUI

struct TranslateWord: View {
    var body: some View {
        LevelCell {
            VStack(spacing: 0) {
                ForEach(1 ... 4, id: \.self) { index in
                    Button("Вариант \(index)") {}
                        .padding()
                        .frame(width: .infinity)
                        .border(width: 0.4, edges: [.top], color: Color(.separator))
                        .tint(.primary)
                }
            }
        }
    }
}

struct TranslateWord_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TranslateWord()
        }
        .background(Color("BackgroundColor"))
        .preferredColorScheme(.dark)
    }
}
