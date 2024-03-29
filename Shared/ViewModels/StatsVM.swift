//
//  ProgressStatVM.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/9/24.
//

import Foundation
import Observation

@Observable
class StatsVM: ObservableObject {
    var rangeStart: CGFloat = 0.6
    var rangeEnd: CGFloat = 1
    var showAddedData = true
    var showLearnedData = true
    
    var stats: [ProgresStat] = [
        .init(date: Date.from(year: 2023, month: 10, day: 1), added: 10, learned: 10),
        .init(date: Date.from(year: 2023, month: 10, day: 2), added: 14, learned: 5),
        .init(date: Date.from(year: 2023, month: 10, day: 3), added: 16, learned: 16),
        .init(date: Date.from(year: 2023, month: 10, day: 4), added: 10, learned: 20),
        .init(date: Date.from(year: 2023, month: 10, day: 5), added: 1, learned: 8),
        .init(date: Date.from(year: 2023, month: 10, day: 6), added: 1, learned: 11),
        .init(date: Date.from(year: 2023, month: 10, day: 7), added: 5, learned: 9),
        .init(date: Date.from(year: 2023, month: 10, day: 8), added: 5, learned: 4),
        .init(date: Date.from(year: 2023, month: 10, day: 9), added: 4, learned: 2),
        .init(date: Date.from(year: 2023, month: 10, day: 10), added: 6, learned: 1),
        .init(date: Date.from(year: 2023, month: 10, day: 11), added: 5, learned: 4),
        .init(date: Date.from(year: 2023, month: 10, day: 12), added: 2, learned: 9),
        .init(date: Date.from(year: 2023, month: 10, day: 13), added: 2, learned: 9),
        .init(date: Date.from(year: 2023, month: 10, day: 14), added: 4, learned: 3),
        .init(date: Date.from(year: 2023, month: 10, day: 15), added: 7, learned: 10),
        .init(date: Date.from(year: 2023, month: 10, day: 16), added: 8, learned: 5),
        .init(date: Date.from(year: 2023, month: 10, day: 17), added: 1, learned: 16),
    ]
    
    func filteredData() -> [ProgresStat] {
        let sortedData = stats.sorted { $0.date < $1.date }
        guard let firstDate = sortedData.first?.date, let lastDate = sortedData.last?.date else { return [] }
        
        let totalSeconds = lastDate.timeIntervalSince(firstDate)
        let startSeconds = totalSeconds * Double(rangeStart)
        let endSeconds = totalSeconds * Double(rangeEnd)
        
        let startDate = firstDate.addingTimeInterval(startSeconds)
        let endDate = firstDate.addingTimeInterval(endSeconds)
        
        return sortedData.filter { $0.date >= startDate && $0.date <= endDate }
    }
    
    func getTitle() -> String {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            
            return formatter
        }()
        
        func computeDate(for value: CGFloat, in sortedData: [ProgresStat]) -> Date {
            guard let firstDate = sortedData.first?.date, let lastDate = sortedData.last?.date else { return Date() }
            let totalSeconds = lastDate.timeIntervalSince(firstDate)
            let adjustedSeconds = totalSeconds * Double(value)
            return firstDate.addingTimeInterval(adjustedSeconds)
        }
        
        return "\(dateFormatter.string(from: computeDate(for: rangeStart, in: stats))) - \(dateFormatter.string(from: computeDate(for: rangeEnd, in: stats)))"
    }
    
    func getStat(for targetDate: Date) -> ProgresStat? {
        let calendar = Calendar.current
        let targetDateComponents = calendar.dateComponents([.year, .month, .day], from: targetDate)
        
        return stats.first { stat in
            let statDateComponents = calendar.dateComponents([.year, .month, .day], from: stat.date)
            
            return statDateComponents.year == targetDateComponents.year &&
                statDateComponents.month == targetDateComponents.month &&
                statDateComponents.day == targetDateComponents.day
        }
    }
}
