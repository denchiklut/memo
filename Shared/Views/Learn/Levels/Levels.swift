//
//  Levels.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Levels: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            
            AppHeader()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack() {
                        cell(header: "Text Here", image: "calendar")
                    }
                    HStack {
                        cell(header: "Word - translation",  image: "cube.transparent")
                        cell(header: "Translation - word",  image: "cube.transparent.fill")
                    }
                }
                .padding()
            }
            .offset(y: 110)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    func cell(header: String, image: String) -> some View {
        NavigationLink(destination: Level()) {
            VStack {
                Text(header)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            .background(Color("MenuColor"))
            .cornerRadius(10)
        }
    }
}

struct Levels_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Levels()
        }
//            .preferredColorScheme(.dark)
    }
}
