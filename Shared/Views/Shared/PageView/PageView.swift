//
//  PageView.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/24/22.
//

import SwiftUI

struct PageView<Page: View>: View {
    @Binding var currentPage: Int
    var pages: [Page]

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        Level()
    }
}
