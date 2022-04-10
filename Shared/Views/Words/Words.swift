//
//  Words.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Words: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            AppHeader()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Hello, World!")
                }
                .padding()
            }
            .offset(y: 110)
        }
        .ignoresSafeArea()
    }
}

struct Words_Previews: PreviewProvider {
    static var previews: some View {
        Words()
    }
}
