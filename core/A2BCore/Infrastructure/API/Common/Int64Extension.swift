//
//  Int64Extension.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 19/04/2021.
//

import Foundation

public extension Int64 {
    
    func asDate() -> Date {
        let milliseconds = Double(self)
        let timeInterval = TimeInterval(milliseconds)
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    func secondsToHoursMinutesSeconds() -> (hour: Int, minute: Int, second: Int) {
      return (Int(self / 3600), Int((self % 3600) / 60), Int((self % 3600) % 60))
    }
}
