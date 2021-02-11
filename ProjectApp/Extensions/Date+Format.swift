//
//  Date+Format.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/11/21.
//

import Foundation

extension Date {
    
    static let hourFormat = "h:mm a"

    func dateFormatWithSuffix() -> String {
        return "MMM dd'\(self.daySuffix())'"
    }

    func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
    
    func formattedProjectDate() -> String {
        let dateFormatter = Current.dateFormatter()
        dateFormatter.dateFormat = self.dateFormatWithSuffix()
        let dateString = dateFormatter.string(from: self)
        
        let hourFormatter = Current.dateFormatter()
        hourFormatter.dateFormat = Date.hourFormat
        let hourString = hourFormatter.string(from: self)
        
        
        return "\(dateString), \(hourString)"
    }
}
