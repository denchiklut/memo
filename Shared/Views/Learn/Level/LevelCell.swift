//
//  LevelCell.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/24/22.
//

import SwiftUI

struct LevelCell: View {
    var index: Int
    var onAnswer: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("PaperColor"))
                .overlay(
                    VStack {
                        Spacer()
                        WordListen()
                        Spacer()
                        VStack(spacing: 0) {
                            ForEach(1...4, id:\.self) { index in
                                Button("Вариант \(index)") {
                                    onAnswer()
                                }
                                .padding()
                                .frame(width: getRect().width)
                                .border(width: 0.4, edges: [.top], color: Color(.separator))
                                .tint(.primary)
                            }
                        }
                    }
                )
            Spacer()
        }
        .clipped()
        .padding()
        .shadow(color: .black.opacity(0.05), radius: 7, x: 0, y: 4)
    }
}

struct LevelCell_Previews: PreviewProvider {
    static var previews: some View {
        LevelCell(index: 0) {
            
        }
    }
}
