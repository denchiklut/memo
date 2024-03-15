//
//  RangeSlider.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/9/24.
//

import SwiftUI

struct RangeSelection: View {
    @AppStorage("darkMode") var darkMode = false
    @ObservedObject var statsVM: StatsVM

    let fullWidth: CGFloat

    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: Gradient(stops: [.init(color: darkMode ? Color.black.opacity(0.2) : Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)).opacity(0.5), location: 0)]),
                startPoint: .leading,
                endPoint: .trailing
            ))
            .cornerRadius(4)
            .frame(width: (statsVM.rangeStart * fullWidth) + 6)

        Rectangle()
            .fill(LinearGradient(
                gradient: Gradient(stops: [.init(color: darkMode ? Color.black.opacity(0.2) : Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)).opacity(0.5), location: 0)]),
                startPoint: .leading,
                endPoint: .trailing
            ))
            .cornerRadius(4)
            .frame(width: fullWidth * (1 - statsVM.rangeEnd) + 6)
            .offset(x: (statsVM.rangeEnd * fullWidth) - 6)
    }
}

#Preview {
    StatsRange(statsVM: StatsVM())
        .padding(.all)
}
