//
//  RangeButton.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/9/24.
//

import SwiftUI

struct RangeButton: View {
    @Environment(\.direction) var rangeButtonDirection

    private var systemName: String {
        if rangeButtonDirection == .left {
            return "chevron.left"
        }
        return "chevron.right"
    }

    var body: some View {
        ZStack {
            Color.gray
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 8)
                .padding(.horizontal, 2)
        }
        .frame(width: 12)
        .clipShape(rangeButtonDirection == .left ? .rect(topLeadingRadius: 4, bottomLeadingRadius: 4) : .rect(bottomTrailingRadius: 4, topTrailingRadius: 4))
    }
}

enum RangeButtonDirection {
    case left
    case right
}

struct RangeButtonDirectionKey: EnvironmentKey {
    static var defaultValue: RangeButtonDirection = .left
}

extension EnvironmentValues {
    var direction: RangeButtonDirection {
        get { self[RangeButtonDirectionKey.self] }
        set { self[RangeButtonDirectionKey.self] = newValue }
    }
}

extension View {
    func direction(_ direction: RangeButtonDirection) -> some View {
        environment(\.direction, direction)
    }
}

#Preview {
    HStack {
        RangeButton()
            .border(width: 2, edges: [.bottom, .leading, .trailing, .top], color: .green)

        RangeButton()
            .direction(.right)
    }
    .frame(height: 40)
}
