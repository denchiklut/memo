//
//  View.swift
//  Memo
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }

    func getSafeArea() -> UIEdgeInsets {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
