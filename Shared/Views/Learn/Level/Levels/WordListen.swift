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
        ZStack {
            Circle()
                .strokeBorder(.blue)
                .overlay(
                    Button(action: {
                        isPlaying.toggle()
                    }) {
                        Text("")
                            .frame(width: 190, height: 190)
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                                    .overlay {
                                        Image(
                                            systemName: isPlaying ? "pause" : "play.fill"
                                        )
                                        .foregroundColor(.blue)
                                        .font(.system(size: 60))
                                    }
                            )
                    }
                )
                .background(.white, in: Circle())
                .frame(width: 190, height: 190)
        }
    }
}

struct WordListen_Previews: PreviewProvider {
    static var previews: some View {
        WordListen()
    }
}
