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
