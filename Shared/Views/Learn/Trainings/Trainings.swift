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
                    VStack {
                        VStack {
                            HStack {
                                VStack {
                                    HStack {
                                        Text("Learned today:")
                                        Spacer()
                                    }
                                    HStack {
                                        HStack(alignment: .lastTextBaseline, spacing: 0) {
                                            Text("0")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(.accentColor)
                                            Text("/10")
                                        }
                                        Image(systemName: "pencil")
                                        Spacer()
                                    }
                                }

                                Image(systemName: "trophy")
                                    .font(.largeTitle)
                            }
                            .padding()
                            .background(.thinMaterial, in: .rect(cornerRadius: 10))
                            .padding(.bottom, 8)

                            LazyVGrid(columns: [.init(), .init(), .init()]) {
                                VStack {
                                    Text("Total Words")
                                        .font(.caption)
                                    Text("560")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }

                                VStack {
                                    Text("To repeat")
                                        .font(.caption)
                                    Text("302")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                VStack {
                                    Text("Learnt")
                                        .font(.caption)
                                    Text("287")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                            }

                            Button(action: {}) {
                                Text("Repeat words")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.vertical)
                        }
                        .padding()
                        .background(Color("PaperColor"), in: .rect(cornerRadius: 10))
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 24)

                    HStack {
                        Text("Trainings")
                        Spacer()
                    }
                    HStack {
                        cell(header: "Word - translation", image: "cube.transparent")
                        cell(header: "Translation - word", image: "cube.transparent.fill")
                    }
                    HStack {
                        cell(header: "Listening", image: "airpodsmax")
                        cell(header: "Word - Builder", image: "rectangle.and.pencil.and.ellipsis")
                    }
                }
                .padding(.bottom, 100)
            }
            .padding()
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
