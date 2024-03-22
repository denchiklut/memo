//
//  RangeChart.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/10/24.
//

import Charts
import SwiftUI

struct RangeChart: View {
    @AppStorage("accent_color") var accentColor: String = "pink"
    let data: [ProgresStat]

    var body: some View {
        Chart {
            ForEach(data) { stat in
                BarMark(
                    x: .value("Day", stat.date, unit: .day),
                    y: .value("Learned", stat.learned)
                )
                .foregroundStyle(Color.from(name: accentColor).gradient)

                BarMark(
                    x: .value("Day", stat.date, unit: .day),
                    y: .value("Added", stat.added)
                )
                .foregroundStyle(.blue.gradient)
            }
        }
        .background(Color("PaperColor"))
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
        .cornerRadius(4)
    }
}

#Preview {
    RangeChart(data: StatsVM().stats)
        .frame(height: 40)
        .padding(.horizontal)
}
