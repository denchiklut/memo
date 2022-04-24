//
//  PageView.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/24/22.
//

import SwiftUI


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        return UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
        )
    }

    class Coordinator: NSObject {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { page in
                let hv = UIHostingController(rootView: page)
                hv.view.backgroundColor = .clear

                return hv
            }
        }
    }
}
