//
//  AnimatedGradient.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/24/24.
//

import SwiftUI

struct AnimatedGradient: View {
    @State private var currentIndex = 0
    private var colorSets: [[Color]]
    private var startPoint: UnitPoint
    private var endPoint: UnitPoint
    private var animationDuration: Double // Specify the animation duration
    private var animationCurve: Animation

    init(colors: [Color],
         startPoint: UnitPoint = .topLeading,
         endPoint: UnitPoint = .bottomTrailing,
         animationDuration: Double = 2.0, // Default duration
         animationCurve: Animation = Animation.linear(duration: 2.0))
    {
        // Ensure the sequence includes reverse order without duplicating the first and last pairs
        var extendedColors = colors
        if colors.count > 1 { // Check to avoid out-of-bounds errors for arrays with < 2 elements
            extendedColors += colors.dropFirst().dropLast()
        }
        // Create color pairs from the extended color array
        self.colorSets = (0 ..< extendedColors.count).map { index in
            [extendedColors[index % extendedColors.count], extendedColors[(index + 1) % extendedColors.count]]
        }

        self.startPoint = startPoint
        self.endPoint = endPoint
        self.animationDuration = animationDuration
        self.animationCurve = animationCurve
    }

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: currentColors),
            startPoint: startPoint,
            endPoint: endPoint
        )
        .edgesIgnoringSafeArea(.all)
        .animation(animationCurve, value: currentIndex)
        .onAppear {
            cycleColors()
        }
    }

    private func cycleColors() {
        currentIndex = (currentIndex + 1) % colorSets.count

        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            withAnimation(self.animationCurve) {
                self.cycleColors()
            }
        }
    }

    private var currentColors: [Color] {
        guard currentIndex < colorSets.count else { return [.black, .white] }
        return colorSets[currentIndex]
    }
}

#Preview {
    AnimatedGradient(colors: [
        Color(hex: "#0077ff"),
        Color(hex: "#6b93ff"),
        Color(hex: "#8878ff"),
        Color(hex: "#e46ace"),
    ])
}
