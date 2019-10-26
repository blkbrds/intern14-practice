//
//  DateTimeUtils.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class Helper {
    
    static let shared = Helper()
 
    let YYYYMMDDThhmmssZ = "YYYY-MM-DDThh:mm:ssZ"
    let YYYYMMDDThhmmssZNew = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    let YYYYMMDDhhmmss = "yyyy-MM-dd HH:mm:ss"
    let YYYYMMDDhhmm = "yyyy-MM-dd HH:mm"
    let yyyyMMdd = "yyyy-MM-dd"

    private let dateFormatter = DateFormatter()
    private var dateComponent = DateComponents()
    let gregorianCalendar = Calendar(identifier: .gregorian)
    let calendar = Calendar.current

    private init() {
    }
    
    /**
     * Convert String to date  by pattern.
     */
    func convertStringToDate(date: String, withFormat pattern: String) -> Date? {
        dateFormatter.dateFormat = pattern
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from:date)
    }

    /**
     * Convert date to string by patten.
     */
    func convertDateToString(date: Date, withFormat pattern: String) -> String? {

        dateFormatter.dateFormat = pattern
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    
    /**
     * Create date from input parameter.
     */
    func createDate(day: Int, month: Int, year: Int) -> Date? {
        dateComponent.day = day
        dateComponent.month = month
        dateComponent.year = year
        return gregorianCalendar.date(from: dateComponent)
    }

    /**
     * Create date from string inputs.
     */
    func createDate(day: String, month: String, year: String) -> Date? {
        guard let dayValue = Int(day) else { return nil }
        guard let monthValue = Int(month) else { return nil }
        guard let yearValue = Int(year) else { return nil }
        
        return createDate(day: dayValue, month: monthValue, year: yearValue)
    }
    
    func convertStringToComponents(from: String) -> DateComponents? {
        let date = convertStringToDate(date: from, withFormat: YYYYMMDDhhmmss)
        if let date = date {
            return gregorianCalendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        }
        return nil
    }
    
    func convertStringToShortDate(from: String) -> Date? {
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        return dateFormatter.date(from: from) // 21/7/2019, 9:41 AM
    }
}
