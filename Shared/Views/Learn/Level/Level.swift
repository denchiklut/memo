//
//  Level.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Level: View {
    @State var current = 0
    
    func onAnswer() {
        current = current + 1
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AppHeader()
         
            PageView(
                currentPage: $current,
                pages: arr.map { LevelCell(index: $0) {
                    onAnswer()
                } }
            )
            
        }
        .background(Color("BackgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

struct Level_Previews: PreviewProvider {
    static var previews: some View {
        Level()
    }
}
