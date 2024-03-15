//
//  Language.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/14/22.
//

import SwiftUI

struct Language: View {
    @State var selected = 0
    @Binding var isPromted: Bool

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Image(systemName: "globe")
                    .font(.system(size: 136))
                    .foregroundColor(.secondary)
                Text("Choose language")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            .padding()

            VStack(spacing: 0) {
                ForEach(langs.indices, id: \.self) { index in
                    Divider()
                        .padding(.leading)
                        .opacity(index == 0 ? 0 : 1)

                    Button(action: {
                        selected = index
                    }) {
                        HStack {
                            Text(langs[index])
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: selected == index ? "largecircle.fill.circle" : "circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.pink)
                                .frame(width: 20, height: 20)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                }
            }
            .background(.regularMaterial)
            .cornerRadius(10)

            Spacer()

            Button(action: {
                isPromted.toggle()
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
            }
            .buttonStyle(.bordered)
            .tint(.pink)
        }
        .padding()
        .background(Color("BackgroundColor"))
        .preferredColorScheme(.dark)
    }
}

let langs = ["Enflish", "Franch"]
struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language(isPromted: .constant(false))
//            .preferredColorScheme(.dark)
    }
}
