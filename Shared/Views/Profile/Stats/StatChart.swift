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
    var showAddedData: Bool
    var showLearnedData: Bool
    
    var body: some View {
        Chart {
            RuleMark(y: .value("Avg", 15))
                .foregroundStyle(.blue)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
            
            ForEach(data) { stat in
                if showLearnedData {
                    BarMark(
                        x: .value("Day", stat.date, unit: .day),
                        y: .value("Learned", stat.learned)
                    )
                    .foregroundStyle(.pink.gradient)
                }
                
                if showAddedData {
                    BarMark(
                        x: .value("Day", stat.date, unit: .day),
                        y: .value("Added", stat.added)
                    )
                    .foregroundStyle(.blue.gradient)
                }
              
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
