//
//  DateHelper.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/18/22.
//

import Foundation

class DateHelper {
    
//    static func getDates() -> [TimeZoneViewModel] {
//        var dates = TimeZoneViewModel.dates
//        
//        for index in 0..<dates.count {
//            if
//                let date = formatDate(dates[index].hour),
//                let currentDate = formatedCurrentDate()
//            {
//                if currentDate < date {
//                    dates[index - 1].isFocused = true
//                    break
//                }
//            }
//        }
//        
//        return dates
//    }
    
    private static func formatDate(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        return formatter.date(from: dateString)
    }
    
    private static func formatedCurrentDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        let currentDateString = formatter.string(from: Date())
        return formatDate(currentDateString)
    }
    
    static func formatToAmPm(_ timeStamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        formatter.timeZone = .current//TimeZone.init(abbreviation: "UTC")
        let date = Date.init(timeIntervalSince1970: TimeInterval(timeStamp))
        return formatter.string(from: date)
    }
    
    static func formatDateToDay(_ timeStamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.timeZone = .current//TimeZone.init(abbreviation: "UTC")
        let date = Date.init(timeIntervalSince1970: TimeInterval(timeStamp))
        return formatter.string(from: date)
    }
}
