//
//  Slider.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import Charts
import SwiftUI

struct StatsRange: View {
    @ObservedObject var statsVM: StatsVM
    
    @State private var initialDragPosition: CGFloat? = nil
    @State private var initialRangeStart: CGFloat = 0.0
    @State private var initialRangeEnd: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Group {
                    RangeChart(data: statsVM.stats)
                    RangeSelection(statsVM: statsVM, fullWidth: geometry.size.width)
                }
                .frame(height: 40)
                
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .border(width: 2, edges: [.top, .bottom], color: .gray)
                    .cornerRadius(4)
                    .frame(width: (statsVM.rangeEnd - statsVM.rangeStart) * geometry.size.width)
                    .offset(x: statsVM.rangeStart * geometry.size.width)
                    .gesture(DragGesture()
                        .onChanged { value in
                            if initialDragPosition == nil { // Capture initial positions at the start of the drag
                                initialDragPosition = value.location.x / geometry.size.width
                                initialRangeStart = statsVM.rangeStart
                                initialRangeEnd = statsVM.rangeEnd
                            }
                            
                            let currentDragPosition = value.location.x / geometry.size.width
                            let dragOffset = currentDragPosition - initialDragPosition!
                            
                            // Calculate new start and end positions
                            let newStart = max(min(initialRangeStart + dragOffset, 1 - (initialRangeEnd - initialRangeStart)), 0)
                            let newEnd = min(max(initialRangeEnd + dragOffset, initialRangeEnd - initialRangeStart), 1)
                            
                            if newStart >= 0, newEnd <= 1 {
                                statsVM.rangeStart = newStart
                                statsVM.rangeEnd = newEnd
                            }
                        }
                        .onEnded { _ in
                            initialDragPosition = nil // Reset for the next drag
                        }
                    )
                
                // Left fade effect with sharper gradient
                RangeButton()
                    .direction(.left)
                    .offset(x: statsVM.rangeStart * geometry.size.width)
                    .gesture(DragGesture()
                        .onChanged { value in
                            let newPosition = value.location.x / geometry.size.width
                            let minimumDistanceFraction = 24 / geometry.size.width
                            statsVM.rangeStart = min(max(0, newPosition), statsVM.rangeEnd - minimumDistanceFraction)
                        })
          
                // Right fade effect with sharper gradient
                RangeButton()
                    .direction(.right)
                    .offset(x: statsVM.rangeEnd * geometry.size.width - 12)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newPosition = value.location.x / geometry.size.width
                                let minimumDistanceFraction = 24 / geometry.size.width
                                statsVM.rangeEnd = max(min(1, newPosition), statsVM.rangeStart + minimumDistanceFraction)
                            }
                    )
            }
        }
        .frame(height: 44)
        .cornerRadius(4)
    }
}

#Preview {
    StatsRange(statsVM: StatsVM())
        .padding()
}
