//
//  ProgresStat.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import Foundation


struct ProgresStat: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let added: Int
    let learned: Int
    
    static func == (lhs: ProgresStat, rhs: ProgresStat) -> Bool {
      return lhs.id == rhs.id // if ids are unique for each stat
  }
    
}

class ProgresStatGenerator {
    static func generateRandomData(from startDate: Date, to endDate: Date, count: Int) -> [ProgresStat] {
        var dataset = [ProgresStat]()
        let calendar = Calendar.current
        let dateRange = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
        
        for _ in 1...count {
            let randomDaysOffset = Int.random(in: 0...dateRange)
            let randomDate = calendar.date(byAdding: .day, value: randomDaysOffset, to: startDate)!
            let randomAdded = Int.random(in: 1...20)
            let randomLearned = Int.random(in: 1...20)
            
            let stat = ProgresStat(date: randomDate, added: randomAdded, learned: randomLearned)
            dataset.append(stat)
        }
        
        return dataset.sorted { $0.date < $1.date }
    }
}
