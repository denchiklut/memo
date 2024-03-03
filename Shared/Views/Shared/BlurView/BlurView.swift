//
//  BlurView.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/13/22.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
    
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) { }
}

