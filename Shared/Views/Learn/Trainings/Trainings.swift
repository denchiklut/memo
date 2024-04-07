//
//  Levels.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Trainings: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    LearnStats()
                        .padding(.top, 100)
                        .padding(.bottom, 24)

                    HStack {
                        Text("Trainings")
                        Spacer()
                    }
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        Cell(title: "Word - translation", image: "cube.transparent") {
                            Level(program: .translate)
                        }
                        Cell(title: "Listening", image: "airpodsmax") {
                            Level(program: .listening)
                        }
                        Cell(title: "Word - Builder", image: "rectangle.and.pencil.and.ellipsis") {
                            Level(program: .wordBuilder)
                        }
                    }
                }
                .padding(.bottom, 100)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct Cell<Content: View>: View {
    let title: String
    let image: String
    let content: Content

    init(title: String, image: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.image = image
        self.content = content()
    }

    var body: some View {
        NavigationLink(destination: content) {
            VStack {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
        }
        .background(Color("PaperColor"))
        .cornerRadius(10)
    }
}

struct Trainings_Previews: PreviewProvider {
    static var previews: some View {
        Learn()
            .preferredColorScheme(.dark)
            .accentColor(.pink)
    }
}
