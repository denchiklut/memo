//
//  Shakable.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/14/24.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(
            translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0
        ))
    }
}

struct ShakeableModifier: ViewModifier {
    var shake: Bool
    @State private var shakes = 0

    func body(content: Content) -> some View {
        content
            .animation(Animation.default, value: shakes)
            .modifier(ShakeEffect(animatableData: CGFloat(shakes)))
            .onTapGesture {
                if shake {
                    withAnimation {
                        shakes += 1
                    }
                }
            }
    }
}

extension View {
    func shakeable(_ shake: Bool) -> some View {
        modifier(ShakeableModifier(shake: shake))
    }
}
