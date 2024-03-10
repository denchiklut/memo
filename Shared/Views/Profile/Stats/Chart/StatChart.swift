//
//  StatChart.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import Charts
import SwiftUI

struct StatChart: View {
    @ObservedObject var statsVM: StatsVM
    @State private var selectedData: ProgresStat?

    var body: some View {
        ZStack(alignment: .top) {
            Chart {
                RuleMark(y: .value("Avg", 15))
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                ForEach(statsVM.filteredData()) { stat in
                    if statsVM.showLearnedData {
                        BarMark(
                            x: .value("Day", stat.date, unit: .day),
                            y: .value("Learned", stat.learned)
                        )
                        .foregroundStyle(.pink.gradient)
                        .opacity(selectedData == nil ? 1 : selectedData?.id != stat.id ? 0.6 : 1)
                    }

                    if statsVM.showAddedData {
                        BarMark(
                            x: .value("Day", stat.date, unit: .day),
                            y: .value("Added", stat.added)
                        )
                        .foregroundStyle(.blue.gradient)
                        .opacity(selectedData == nil ? 1 : selectedData?.id != stat.id ? 0.6 : 1)
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
                GeometryReader { _ in
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let location = value.location
                                    if let date: Date = proxy.value(atX: location.x) {
                                        selectedData = statsVM.getStat(for: date)
                                    }
                                }
                                .onEnded { _ in
                                    selectedData = nil
                                }
                        )
                }
            }
            .onChange(of: selectedData) { _ in
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.prepare() // Optionally prepare for a more immediate feedback
                generator.impactOccurred()
            }

            // Details View
            if let selectedStat = selectedData {
                Text("Added \(selectedStat.added)")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .animation(.easeInOut, value: statsVM.rangeStart)
        .animation(.easeInOut, value: statsVM.rangeEnd)
        .animation(.easeInOut, value: statsVM.showAddedData)
        .animation(.easeInOut, value: statsVM.showLearnedData)
    }
}

#Preview {
//    StatChart(statsVM: StatsVM())
    Stats()
}
