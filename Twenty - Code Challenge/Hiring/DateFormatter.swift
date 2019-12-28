//
//  DateFormatter.swift
//  Hiring
//
//  Created by Armando Gonzalez on 2/28/19.
//  Copyright © 2019 Twenty. All rights reserved.
//

import Foundation

class EpisodeDateFormatter {
    static let shared = EpisodeDateFormatter()
    private let dateFormatter = DateFormatter()
    
    private init() {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.pmSymbol = "PM"
        dateFormatter.amSymbol = "AM"
        dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd/yy, h:m")
    }
    
    func getPrettyDate(from apiDateString: String) -> String {
        guard let date = dateFormatter.date(from: apiDateString) else { return "Unable to parse date" }
        let cal = Calendar.current
        let components = cal.dateComponents([.year, .month, .day, .hour], from: date)
        guard let composedDate = cal.date(from: components) else { return "Unable to parse date" }
        return dateFormatter.string(from: composedDate)
    }
    
}
