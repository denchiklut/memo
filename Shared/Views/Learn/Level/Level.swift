//
//  Level.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Level: View {
    let program: ProgramType
    @State var current = 0

    var body: some View {
        PageView(
            currentPage: $current,
            pages: arr.map { _ in
                VStack {
                    if program == .listening {
                        WordListen()
                    }
                    if program == .translate {
                        TranslateWord()
                    }
                    if program == .wordBuilder {
                        WordBuilder()
                    }
                }
            }
        )
        .background(Color("BackgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

struct Level_Previews: PreviewProvider {
    static var previews: some View {
        Level(program: .wordBuilder)
    }
}
