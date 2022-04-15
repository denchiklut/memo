//
//  TabsView.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/15/22.
//

import SwiftUI

struct TabsView: View {
    @State var currentTab = 1
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            TabsHero(tint: .pink, current: $currentTab) {
                Image(systemName: "house.fill")
                    .pageLabel()
                Image(systemName: "magnifyingglass")
                    .pageLabel()
                Image(systemName: "person.fill")
                    .pageLabel()
            } content: {
                List {
                    ForEach(1...100, id:\.self) { index in
                        Text("Item \(index)")
                    }
                }
                .listStyle(.plain)
                    .pageView()
                List {
                    ForEach(1...100, id:\.self) { index in
                        Text("Item \(index)")
                    }
                }
                .listStyle(.plain)
                    .pageView()
                List {
                    ForEach(1...100, id:\.self) { index in
                        Text("Item \(index)")
                    }
                }
                .listStyle(.plain)
                    .pageView()
            }
            .padding(.top)
        }
    }
}



struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
