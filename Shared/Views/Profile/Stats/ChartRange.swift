//
//  Slider.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import SwiftUI
import Charts

struct ChartRange: View {
    @AppStorage("darkMode") var darkMode = false
    
    var data: [ProgresStat]
    @Binding var rangeStart: CGFloat
    @Binding var rangeEnd: CGFloat
    @State private var initialDragPosition: CGFloat? = nil
    @State private var initialRangeStart: CGFloat = 0.0
    @State private var initialRangeEnd: CGFloat = 0.0
    
    var onRangeChanged: (() -> Void)?

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .overlay(content: {
                        Chart {
                            ForEach(data) { stat in
                                BarMark(
                                    x: .value("Day", stat.date, unit: .day),
                                    y: .value("Learned", stat.learned)
                                )
                                .foregroundStyle(.pink.gradient)
                                
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
                    })
                    .frame(height: 40)
                
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .border(width: 2, edges: [.top, .bottom], color: .gray)
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
                                    onRangeChanged?()
                                }
                            }
                            .onEnded { _ in
                                initialDragPosition = nil // Reset for the next drag
                            }
                    )
                
                // Left fade effect with sharper gradient
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(
                            stops: [
                                .init(color: darkMode ? Color.black.opacity(0.2):  Color.white.opacity(0.6), location: 0),
                                .init(color: .clear, location: geometry.size.width)
                            ]
                        ),
                        startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: rangeStart * geometry.size.width, height: 40)
                
                
                //Right fade effect with sharper gradient
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(
                            stops: [
                                .init(color: .clear, location: -geometry.size.width),
                                .init(color:  darkMode ? Color.black.opacity(0.2):  Color.white.opacity(0.6), location: 0)
                            ]
                        ),
                        startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: geometry.size.width * (1 - rangeEnd), height: 40)
                    .offset(x: rangeEnd * geometry.size.width)
                
                
                // Handles for adjusting the start and end of the range
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray)
                    .overlay(
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        )
                    .frame(width: 12, height: 40)
                    .offset(x: rangeStart * geometry.size.width - 6)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newPosition = value.location.x / geometry.size.width
                                rangeStart = min(max(0, newPosition), rangeEnd)
                                onRangeChanged?()
                            }
                    )
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray)
                    .overlay(
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                        )
                    .frame(width: 10, height: 40)
                    .offset(x: rangeEnd * geometry.size.width - 6)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newPosition = value.location.x / geometry.size.width
                                rangeEnd = max(min(1, newPosition), rangeStart)
                                onRangeChanged?()
                            }
                    )
            }
        }
      
        .frame(height: 40)
   
    }
}



#Preview {
    Stats()

}
