//
//  ResizableLV.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 10/2/22.
//

import SwiftUI
import Lottie

struct ResizableLV: UIViewRepresentable {
    var lottieView: AnimationView
    var color: SwiftUI.Color = .blue
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView {
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            
            let fillKeyPath = AnimationKeypath(keys: ["**", "Fill 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
            
            let strokeKeyPath = AnimationKeypath(keys: ["**", "Stroke 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
        }
    }
    
    func addLottieView(to view: UIView) {
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        
        view.addSubview(lottieView)
        view.addConstraints(constraints)
    }
}
