//
//  WordBuilder.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 10/1/22.
//

import SwiftUI

struct WordBuilder: View {
    var body: some View {
        LevelCell {
            Spacer()
            Text("Example")
            HStack(spacing: 0) {
                ForEach("Example".split(separator: ""), id: \.self) { c in
                    Text(c)
                        .padding()
                        .background(.gray.opacity(0.2))
                    Divider()
                }
            }
            .frame(height: 56)
            Spacer()
            HStack(spacing: 0) {
                ForEach("Example".split(separator: ""), id: \.self) { c in
                    Text(c)
                        .padding()
                        .background(.gray.opacity(0.2))
                    Divider()
                }
            }
            .padding(.top, 140)
            .frame(height: 56)
            Spacer()
        }
    }
}

struct WordBuilder_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WordBuilder()
        }
        .background(Color("BackgroundColor"))
        .preferredColorScheme(.dark)
    }
}
