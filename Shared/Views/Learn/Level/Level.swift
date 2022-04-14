//
//  Level.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Level: View {
    var body: some View {
        VStack(spacing: 0) {
            AppHeader()
            
            VStack {
                Color("PaperColor")
                    .overlay(
                        VStack {
                            Spacer()
                            Text("Hi there")
                            Spacer()
                            VStack(spacing: 0) {
                                ForEach(1...4, id:\.self) { index in
                                    Button(action: {}, label: {
                                        Text("Вариант \(index)")
                                    })
                                        .padding()
                                        .frame(width: getRect().width)
                                            .border(width: 0.4, edges: [.top], color: Color("BorderColor"))
                                }
                            }
                        }
                    )
            }
            .cornerRadius(10)
            .clipped()
            .shadow(color: .black.opacity(0.05), radius: 7, x: 0, y: 4)
            .padding(.top)
            .padding(.horizontal)
            .padding(.bottom, 120)
        }
        .background(Color("BackgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Level_Previews: PreviewProvider {
    static var previews: some View {
        Level()
    }
}
