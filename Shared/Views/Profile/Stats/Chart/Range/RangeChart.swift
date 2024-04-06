//
//  RangeChart.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/10/24.
//

import Charts
import SwiftUI

struct RangeChart: View {
    @Bindable var statsVM: StatsVM

    var body: some View {
        Chart {
            ForEach(statsVM.stats) { stat in
                if statsVM.showLearnedData {
                    BarMark(
                        x: .value("Day", stat.date, unit: .day),
                        y: .value("Learned", stat.learned)
                    )
                    .foregroundStyle(Color.accentColor.gradient)
                }

                if statsVM.showAddedData {
                    BarMark(
                        x: .value("Day", stat.date, unit: .day),
                        y: .value("Added", stat.added)
                    )
                    .foregroundStyle(.blue.gradient)
                }
            }
        }
        .background(Color("PaperColor"))
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
        .cornerRadius(4)
        .animation(.easeInOut, value: statsVM.showAddedData)
        .animation(.easeInOut, value: statsVM.showLearnedData)
    }
}

#Preview {
    RangeChart(statsVM: StatsVM())
        .frame(height: 40)
        .padding(.horizontal)
}
