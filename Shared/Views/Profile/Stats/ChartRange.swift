//
//  Slider.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import Charts
import SwiftUI

struct ChartRange: View {
    @AppStorage("darkMode") var darkMode = false
    @ObservedObject var statsVM: StatsVM
    
    @State private var initialDragPosition: CGFloat? = nil
    @State private var initialRangeStart: CGFloat = 0.0
    @State private var initialRangeEnd: CGFloat = 0.0
    
    var onRangeChanged: (() -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Chart {
                    ForEach(statsVM.stats) { stat in
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
                
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .border(width: 2, edges: [.top, .bottom], color: .gray)
                    .cornerRadius(4)
                    .frame(width: (statsVM.rangeEnd - statsVM.rangeStart) * geometry.size.width, height: 40)
                    .offset(x: statsVM.rangeStart * geometry.size.width)
                    .gesture(
                        DragGesture()
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
                                    onRangeChanged?()
                                }
                            }
                            .onEnded { _ in
                                initialDragPosition = nil // Reset for the next drag
                            }
                    )
                
                // Left fade effect with sharper gradient
                Group {
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [.init(color: darkMode ? Color.black.opacity(0.2) : Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)).opacity(0.5), location: 0)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: statsVM.rangeStart * geometry.size.width)
                    
                    ZStack {
                        Color.gray
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 8)
                            .padding(.horizontal, 2)
                    }
                    .clipShape(.rect(topLeadingRadius: 4, bottomLeadingRadius: 4))
                    .padding(.horizontal, 24)
                    .frame(width: 12)
                    .offset(x: statsVM.rangeStart * geometry.size.width)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newPosition = value.location.x / geometry.size.width
                                let minimumDistanceFraction = 24 / geometry.size.width
                                statsVM.rangeStart = min(max(0, newPosition), statsVM.rangeEnd - minimumDistanceFraction)
                                onRangeChanged?()
                            }
                    )
                }
          
                // Right fade effect with sharper gradient
                Group {
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [.init(color: darkMode ? Color.black.opacity(0.2) : Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)).opacity(0.5), location: 0)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: geometry.size.width * (1 - statsVM.rangeEnd))
                        .offset(x: statsVM.rangeEnd * geometry.size.width)
                    
                    ZStack {
                        Color.gray
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 8)
                            .padding(.horizontal, 2)
                    }
                    .clipShape(.rect(bottomTrailingRadius: 4, topTrailingRadius: 4))
                    .padding(.horizontal, 24)
                    .frame(width: 12)
                    .offset(x: statsVM.rangeEnd * geometry.size.width - 12)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newPosition = value.location.x / geometry.size.width
                                let minimumDistanceFraction = 24 / geometry.size.width
                                statsVM.rangeEnd = max(min(1, newPosition), statsVM.rangeStart + minimumDistanceFraction)
                                onRangeChanged?()
                            }
                    )
                }
            }
        }
        .frame(height: 40)
        .cornerRadius(4)
    }
}

#Preview {
    ChartRange(statsVM: StatsVM())
        .padding()
}
