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
    @State private var locationX: CGFloat?

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
                        .onTapGesture { selectedData = nil }
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let location = value.location
                                    if let date: Date = proxy.value(atX: location.x) {
                                        selectedData = statsVM.getStat(for: date)
                                        locationX = location.x
                                    }
                                }
                                .onEnded { _ in selectedData = nil }
                        )
                }
            }
            .onChange(of: selectedData) { _ in
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.prepare()
                generator.impactOccurred()
            }

            if let centerX = locationX, let selectedStat = selectedData {
                ChartTooltip(centerX: centerX, selectedStat: selectedStat)
            }
        }
        .animation(.easeInOut, value: statsVM.rangeStart)
        .animation(.easeInOut, value: statsVM.rangeEnd)
        .animation(.easeInOut, value: statsVM.showAddedData)
        .animation(.easeInOut, value: statsVM.showLearnedData)
    }
}

#Preview {
    StatChart(statsVM: StatsVM())
        .frame(height: 450)
}
