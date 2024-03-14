//
//  ChartTooltip.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/14/24.
//

import SwiftUI

struct ChartTooltip: View {
    var centerX: CGFloat
    var selectedStat: ProgresStat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(selectedStat.date, format: .dateTime.day().month().year())
                    .font(.subheadline)
                    .fontWeight(.bold)
                Divider()

                HStack {
                    Text("Added:")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(selectedStat.added)")
                        .foregroundColor(.blue)
                }
                HStack {
                    Text("Learned:")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(selectedStat.learned)")
                        .foregroundColor(.pink)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 16)
            .frame(maxWidth: 200)
            .background(.ultraThinMaterial)
            .cornerRadius(5)
            .shadow(radius: 2)
            .position(x: adjustedTooltipPosition(centerX: centerX, tooltipWidth: 150, chartWidth: geometry.size.width))
        }
    }

    private func adjustedTooltipPosition(centerX: CGFloat, tooltipWidth: CGFloat, chartWidth: CGFloat) -> CGFloat {
        let halfTooltipWidth = (tooltipWidth + 40) / 2
        let adjustedLeft = max(centerX, halfTooltipWidth)
        let adjustedRight = min(adjustedLeft, chartWidth - halfTooltipWidth)

        return adjustedRight
    }
}

#Preview {
    ChartTooltip(centerX: 0, selectedStat: StatsVM().stats.first!)
        .padding(.top, 200)
        .offset(x: 100)
}
