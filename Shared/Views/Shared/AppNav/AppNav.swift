//
//  AppNavigation.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

struct AppNav<Content: View>: UIViewControllerRepresentable {
    var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let controller = UINavigationController(rootViewController: UIHostingController(rootView: content))
        controller.navigationBar.isHidden = true

        return controller
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
