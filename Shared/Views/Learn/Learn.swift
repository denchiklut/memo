//
//  Learn.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

struct Learn: View {
    var body: some View {
        NavigationView {
            Levels()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Memo")
        }

    }
}


struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn()
    }
}
