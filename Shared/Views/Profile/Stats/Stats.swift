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
    @State private var showAddedData = true
    @State private var showLearnedData = true
    
    let data: [ProgresStat] = [
        .init(date: Date.from(year: 2023, month: 10, day: 1), added: 10, learned: 10),
        .init(date: Date.from(year: 2023, month: 10, day: 2), added: 14, learned: 5),
        .init(date: Date.from(year: 2023, month: 10, day: 3), added: 16, learned: 16),
        .init(date: Date.from(year: 2023, month: 10, day: 4), added: 10, learned: 20),
        .init(date: Date.from(year: 2023, month: 10, day: 5), added: 1, learned: 8),
        .init(date: Date.from(year: 2023, month: 10, day: 6), added: 1, learned: 11),
        .init(date: Date.from(year: 2023, month: 10, day: 7), added: 5, learned: 9),
        .init(date: Date.from(year: 2023, month: 10, day: 8), added: 7, learned: 10),
        .init(date: Date.from(year: 2023, month: 10, day: 9), added: 8, learned: 5),
        .init(date: Date.from(year: 2023, month: 10, day: 10), added: 1,learned: 16),
    ]
    
    private var filteredData: [ProgresStat] {
        let sortedData = data.sorted { $0.date < $1.date }
        guard let firstDate = sortedData.first?.date, let lastDate = sortedData.last?.date else { return [] }
        
        let totalSeconds = lastDate.timeIntervalSince(firstDate)
        let startSeconds = totalSeconds * Double(rangeStart)
        let endSeconds = totalSeconds * Double(rangeEnd)
        
        let startDate = firstDate.addingTimeInterval(startSeconds)
        let endDate = firstDate.addingTimeInterval(endSeconds)
        
        return sortedData.filter { $0.date >= startDate && $0.date <= endDate }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Stats")
                .padding(.bottom)
            
            StatChart(data: filteredData, showAddedData: showAddedData, showLearnedData: showLearnedData)
                 .animation(.easeInOut, value: rangeStart)
                 .animation(.easeInOut, value: rangeEnd) 
                 .animation(.easeInOut, value: showAddedData)
                 .animation(.easeInOut, value: showLearnedData)
             
            ChartRange(data: data, rangeStart: $rangeStart, rangeEnd: $rangeEnd)
                .padding(.top, 23)
            
            ChartLegends(showAddedData: $showAddedData, showLearnedData: $showLearnedData)
                .padding(.top)
        }
        .padding()
        .background(Color("PaperColor"))
    }
}

struct ProgresStat: Identifiable {
    let id = UUID()
    let date: Date
    let added: Int
    let learned: Int
}



#Preview {
//    Stats()
    Profile()
}
