//
//  ContentView.swift
//  Shared
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

enum Tabs {
   case profile, trainging, words
}

struct HomeView: View {
    @AppStorage("darkMode") var darkMode: Bool = true
    @State var currentTub: Tabs = .trainging
    
    var body: some View {
        TabView(selection: $currentTub) {
            Profile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Home")
                }
                .tag(Tabs.profile)
            Learn()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Lern")
                }
                .tag(Tabs.trainging)
            Words()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("Words")
                }
                .tag(Tabs.words)
        }
        .accentColor(.pink)
        .preferredColorScheme(darkMode ? .dark: .light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
