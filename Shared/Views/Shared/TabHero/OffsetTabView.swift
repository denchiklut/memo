//
//  OffsetTabView.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/15/22.
//

import SwiftUI

struct OffsetTabView<Content: View>: UIViewRepresentable {
    var content: Content
    @Binding var offset: CGFloat
    @Binding var current: Int
    
    init(
        current: Binding<Int>,
        offset: Binding<CGFloat>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._current = current
        self._offset = offset
        self.content = content()
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ]
        
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset {
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: OffsetTabView
        
        init(parent: OffsetTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            let maxSize = scrollView.contentSize.width
            let current = (offset / maxSize).rounded()
            
            parent.current = Int(current)
            parent.offset = offset
        }
    }
}
