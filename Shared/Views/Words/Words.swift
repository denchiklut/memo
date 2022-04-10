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
            
            List {
                ForEach(1...25, id:\.self) { index in
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
                    }
                    .listRowBackground(Color.clear)
                    .listSectionSeparator(.hidden)
                    .padding(.vertical, 8)
                    .swipeActions {
                          Button (action: {}) {
                              Image(systemName: "trash")
                          }
                          .tint(Color.red)
                        }
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                UITableView.appearance().showsVerticalScrollIndicator = false
            }
            .listStyle(.plain)
            .padding(.bottom, 193)
            .background(.clear)
            .offset(y: 110)
        }
        .ignoresSafeArea()
    }
}

struct Words_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
