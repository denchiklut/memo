//
//  Date.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import Foundation

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(from: DateComponents(year: year, month: month, day: day))!
    }
}
