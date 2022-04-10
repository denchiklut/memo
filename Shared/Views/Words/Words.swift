//
//  Words.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Words: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            AppHeader()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(1...20, id:\.self) { index in
                        HStack {
                            Circle()
                                .fill(Color.gray.opacity(0.05))
                                .overlay(Text("\(index)")
                                    .foregroundColor(.gray))
                                .font(.footnote)
                                .frame(width: 30)
                            VStack(alignment: .leading) {
                                Text("Item \(index)")
                                    .foregroundColor(.primary)
                                Text("Subtitle")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                     
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "plus")
                            }
                        }
                        .padding()
                        .border(width: 0.4, edges: [.bottom], color: Color("BorderColor"))
                        
                    }
                  
                }
                .padding(.bottom, 210)
            }
            .offset(y: 110)
        }
        .ignoresSafeArea()
    }
}

struct Words_Previews: PreviewProvider {
    static var previews: some View {
        Words()
    }
}
