//
//  LevelCell.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/24/22.
//

import SwiftUI

struct LevelCell<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("PaperColor"))
                .overlay {
                    VStack {
                        content
                    }
                }
            Spacer()
        }
        .clipped()
        .padding()
        .shadow(color: .black.opacity(0.05), radius: 7, x: 0, y: 4)
    }
}

struct LevelCell_Previews: PreviewProvider {
    static var previews: some View {
        LevelCell {
            Text("Level Cell")
        }
        .background(Color("BackgroundColor"))
        .preferredColorScheme(.dark)
    }
}
