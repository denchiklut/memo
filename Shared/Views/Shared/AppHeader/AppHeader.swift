//
//  AppHeader.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct AppHeader: View {
    var body: some View {
        Color("MenuColor")
            .frame(height: 110)
            .overlay(
                HStack(spacing: 6){
                    Text("Memo")
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                        .lineLimit(1)
                }
                .offset(y: 15)
            )
            .border(width: 0.4, edges: [.top, .bottom], color: Color("BorderColor"))
            .zIndex(1)
    }
}

struct AppHeader_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppHeader()
            Spacer()
        }
        .ignoresSafeArea()
    }
}
