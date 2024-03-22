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
    @State private var selected: Date?
    @AppStorage("accent_color") var accentColor: String = "pink"

    var body: some View {
        let data: [ProgresStat] = statsVM.filteredData()

        return ZStack(alignment: .top) {
            Chart {
                RuleMark(y: .value("Avg", 5))
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                ForEach(data) { stat in
                    if statsVM.showLearnedData {
                        BarMark(
                            x: .value("Day", stat.date, unit: .day),
                            y: .value("Learned", stat.learned)
                        )
                        .foregroundStyle(Color.from(name: accentColor).gradient)
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

                if let selected, let selectedData {
                    RuleMark(x: .value("Day", selected))
                        .foregroundStyle(Color("BorderColor").opacity(0))
                        .annotation(
                            position: .top,
                            overflowResolution: .init(x: .fit(to: .chart), y: .disabled)
                        ) {
                            ChartTooltip(selectedStat: selectedData)
                                .offset(y: 64)
                        }
                }
            }
            .chartXSelection(value: $selected)
            .chartXAxis {
                AxisMarks(
                    preset: .automatic,
                    position: .bottom,
                    values: data.count < 5 ? .stride(by: .day) : .automatic
                ) {
                    AxisValueLabel(format: .dateTime.day().month(), centered: data.count < 5)
                }
            }
            .chartYAxis {
                AxisMarks(preset: .aligned, position: .leading)
            }
            .onChange(of: selected) { _, newSelected in
                selectedData = newSelected.flatMap { statsVM.getStat(for: $0) }
            }
            .onChange(of: selectedData) { _, _ in
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.prepare()
                generator.impactOccurred()
            }
            .frame(height: 180)
        }
        .animation(.easeInOut, value: statsVM.rangeStart)
        .animation(.easeInOut, value: statsVM.rangeEnd)
        .animation(.easeInOut, value: statsVM.showAddedData)
        .animation(.easeInOut, value: statsVM.showLearnedData)
    }
}

#Preview {
    Stats()
        .frame(height: 180)
}
