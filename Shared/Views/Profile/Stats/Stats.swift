//
//  Stats.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import SwiftUI
import Charts
 
struct Stats: View {
    @State private var rangeStart: CGFloat = 0.2
    @State private var rangeEnd: CGFloat = 0.8
    @State private var initialDragPosition: CGFloat? = nil
    @State private var initialRangeStart: CGFloat = 0.0
    @State private var initialRangeEnd: CGFloat = 0.0

    let data: [ProgresStat] = [
        .init(date: Date.from(year: 2023, month: 10, day: 1), learned: 10),
        .init(date: Date.from(year: 2023, month: 10, day: 2), learned: 5),
        .init(date: Date.from(year: 2023, month: 10, day: 3), learned: 16),
        .init(date: Date.from(year: 2023, month: 10, day: 4), learned: 20),
        .init(date: Date.from(year: 2023, month: 10, day: 5), learned: 8),
        .init(date: Date.from(year: 2023, month: 10, day: 6), learned: 11),
        .init(date: Date.from(year: 2023, month: 10, day: 7), learned: 9),
        .init(date: Date.from(year: 2023, month: 10, day: 8), learned: 10),
        .init(date: Date.from(year: 2023, month: 10, day: 9), learned: 5),
        .init(date: Date.from(year: 2023, month: 10, day: 10), learned: 16),
    ]
    
    var body: some View {
        VStack {
            Chart {
                RuleMark(y: .value("Coal", 12))
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                
                ForEach(data) { dayStat in
                    BarMark(
                        x: .value("Day", dayStat.date, unit: .day),
                        y: .value("Learned", dayStat.learned)
                    )
                    .foregroundStyle(.pink.gradient)
                }
            }
            .chartXAxis {
                AxisMarks { mark in
                    AxisValueLabel()
                    
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) { mark in
                    AxisValueLabel()
                    AxisGridLine()
                }
            }
            .frame(height: 180)
            
            GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            // Background
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 40)

                            // Selected range
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: (rangeEnd - rangeStart) * geometry.size.width, height: 40)
                                .offset(x: rangeStart * geometry.size.width)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            if initialDragPosition == nil { // Capture initial positions at the start of the drag
                                                initialDragPosition = value.location.x / geometry.size.width
                                                initialRangeStart = rangeStart
                                                initialRangeEnd = rangeEnd
                                            }
                                            
                                            let currentDragPosition = value.location.x / geometry.size.width
                                            let dragOffset = currentDragPosition - initialDragPosition!
                                            
                                            // Calculate new start and end positions
                                            let newStart = max(min(initialRangeStart + dragOffset, 1 - (initialRangeEnd - initialRangeStart)), 0)
                                            let newEnd = min(max(initialRangeEnd + dragOffset, (initialRangeEnd - initialRangeStart)), 1)
                                            
                                            if newStart >= 0, newEnd <= 1 {
                                                rangeStart = newStart
                                                rangeEnd = newEnd
                                            }
                                        }
                                        .onEnded { _ in
                                            initialDragPosition = nil // Reset for the next drag
                                        }
                                )

                            // Handle for adjusting the start of the range
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                .offset(x: rangeStart * geometry.size.width - 15)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let newPosition = value.location.x / geometry.size.width
                                            rangeStart = min(max(0, newPosition), rangeEnd)
                                        }
                                )

                            // Handle for adjusting the end of the range
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                .offset(x: rangeEnd * geometry.size.width - 15)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let newPosition = value.location.x / geometry.size.width
                                            rangeEnd = max(min(1, newPosition), rangeStart)
                                        }
                                )
                        }
                    }
                    .frame(height: 40) // Fixed height for the slider
                    .padding(.horizontal) // Add some padding to ensure handles are fully visible and draggable
        }
        .padding()
    }
}

struct ProgresStat: Identifiable {
    let id = UUID()
    let date: Date
    let learned: Int
}

#Preview {
//    Stats()
    Profile()
}
