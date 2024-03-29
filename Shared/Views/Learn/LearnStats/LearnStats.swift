//
//  LearnStats.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/23/24.
//

import SwiftUI

struct LearnStats: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Learned today:")

                    HStack {
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("0")
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                                .padding(.vertical, -8)
                                .bold()
                            Text("/")
                                .padding(.vertical, -1)
                            Text("10")
                                .padding(.vertical, -3)
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
                        .bold()
                }

                VStack {
                    Text("To repeat")
                        .font(.caption)
                    Text("302")
                        .font(.title)
                        .bold()
                }
                VStack {
                    Text("Learnt")
                        .font(.caption)
                    Text("287")
                        .font(.title)
                        .bold()
                }
            }

            Button(action: {}) {
                Text("ok")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background {
                        AnimatedGradient(colors: [
                            Color(hex: "#0077ff"),
                            Color(hex: "#6b93ff"),
                            Color(hex: "#8878ff"),
                            Color(hex: "#e46ace")
                        ])
                    }
            }
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 11))
            .padding(.vertical)
        }
        .padding()
        .background(Color("PaperColor"), in: .rect(cornerRadius: 10))
    }
}

#Preview {
    LearnStats()
        .padding()
        .preferredColorScheme(.dark)
        .accentColor(.pink)
}
