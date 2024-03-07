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
    
    @State private var selectedData: ProgresStat?

    
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
                    .foregroundStyle(selectedData?.id == stat.id ? Color.green.gradient : Color.pink.gradient)
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
        .chartOverlay { proxy in
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let location = value.location
                                if let date: Date = proxy.value(atX: location.x) {
                                    selectedData = getValue(for: date, within: data)
                                }
                            }
                            .onEnded { _ in
                                selectedData = nil
                            }
                    )
            }
        }
        // Details View
         if let selectedStat = selectedData {
             Text("Added \(selectedStat.added)")
                 .padding()
                 .background(Color.gray.opacity(0.2))
                 .cornerRadius(10)
         }
    }

    // Example function to get a value for a given date from your data array
    // This will depend on how your actual data is structured
    func getValue(for targetDate: Date, within data: [ProgresStat]) -> ProgresStat? {
        let calendar = Calendar.current
        let targetDateComponents = calendar.dateComponents([.year, .month, .day], from: targetDate)
        
        return data.first { stat in
            let statDateComponents = calendar.dateComponents([.year, .month, .day], from: stat.date)
            return statDateComponents.year == targetDateComponents.year &&
                   statDateComponents.month == targetDateComponents.month &&
                   statDateComponents.day == targetDateComponents.day
        }
    }
}


#Preview {
    Stats()
}
