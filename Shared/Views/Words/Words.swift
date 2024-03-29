//
//  Words.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI
import UIKit

struct Words: View {
    @State var search = ""
//    @Environment(\.colorScheme) var colorScheme
    @State private var selection: String?

//    init() {
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = colorScheme == .dark
//            ? UIColor(cgColor: CGColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.9))
//            : UIColor(cgColor: CGColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 0.9))
//        appearance.shadowColor = UIColor.systemGray4
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    }

    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach(1 ... 25, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Item \(index)")
                            .foregroundColor(.primary)
                        Text("Subtitle")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .listSectionSeparator(.hidden)
                    .padding(.vertical, 8)
                    .swipeActions {
                        Button(action: {}) {
                            Image(systemName: "trash")
                        }
                        .tint(Color.red)
                    }
                }
                .onDelete { _ in
                }
            }
            .navigationTitle("Dictionary")
            .searchable(
                text: $search,
                placement: .navigationBarDrawer(displayMode: .automatic)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
        }
    }
}

struct Words_Previews: PreviewProvider {
    static var previews: some View {
        Words()
    }
}
