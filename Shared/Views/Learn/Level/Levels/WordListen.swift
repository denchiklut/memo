//
//  WordListen.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 10/1/22.
//

import SwiftUI
import Liquid

struct WordListen: View {
    @State var isPlaying = false
    
    var body: some View {
        ZStack {
            Liquid()
                .frame(width: 240, height: 240)
                .foregroundColor(.blue)
                .opacity(0.3)
            
            Liquid()
                .frame(width: 220, height: 220)
                .foregroundColor(.blue)
                .opacity(0.6)
            
            Liquid(samples: 5)
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            
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
                                            systemName: isPlaying ? "pause": "play.fill"
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
