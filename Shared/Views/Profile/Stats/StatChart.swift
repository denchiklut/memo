//
//  StatChart.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import SwiftUI
import Charts

struct StatChart: View {
    var data: [ProgresStat]
    
    var body: some View {
        Chart {
            RuleMark(y: .value("Avg", 15))
                .foregroundStyle(.blue)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
            
            ForEach(data) { stat in
                BarMark(
                    x: .value("Day", stat.date, unit: .day),
                    y: .value("Learned", stat.learned)
                )
                .foregroundStyle(.pink.gradient)
            }
        }
        .chartXAxis {
            AxisMarks(preset: .aligned) {
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(preset: .aligned, position: .leading)
        }
        .frame(height: 180)
    }
}


#Preview {
    Stats()
}
