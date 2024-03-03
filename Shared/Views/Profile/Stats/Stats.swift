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
            StatChart(data: filteredData)
                 .animation(.easeInOut, value: rangeStart) // Animate on rangeStart change
                 .animation(.easeInOut, value: rangeEnd) // Animate on rangeEnd change
             
            ChartRange(data: data, rangeStart: $rangeStart, rangeEnd: $rangeEnd)
                .padding(.top, 23)
        }
        .padding()
        .background(Color("PaperColor"))
    }
}

struct ProgresStat: Identifiable {
    let id = UUID()
    let date: Date
    let learned: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(from: DateComponents(year: year, month: month, day: day))!
    }
}

#Preview {
    Stats()
//    Profile()
}
