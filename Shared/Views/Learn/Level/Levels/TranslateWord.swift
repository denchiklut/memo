//
//  TranslateWord.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 10/1/22.
//

import SwiftUI

struct TranslateWord: View {
    @State var current = 0
    
    func onAnswer() {
        current = current + 1
    }
    
    var body: some View {
        PageView(
            currentPage: $current,
            pages: words.map {
                LevelCell(index: $0) {
                    onAnswer()
                }
            }
        )
        .background(Color("BackgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}


struct TranslateWord_Previews: PreviewProvider {
    static var previews: some View {
        TranslateWord()
    }
}
