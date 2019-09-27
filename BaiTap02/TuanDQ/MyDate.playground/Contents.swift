import UIKit

/**
 * Customize Date class.
 */
class Date {
    var day: Int
    var month: Int
    var year: Int
    
    init?(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
        if (day < 1 || day > 32) || (month < 1 || month > 12) {
            return nil
        }
        
    }
    
    func normalize() -> Bool {
        return day > 1 && day < daysIn(month: month) && month > 1 && month < 12 && year >= 1
    }
    
    func daysIn(month: Int) -> Int {
        if month < 1 || month > 12 {
            return 0
        } else {
            switch month {
            case 1, 3, 5, 7, 8, 10, 12: return 31
            case 2:
                if year % 100 == 0 || year % 400 == 0 || year % 4 == 0 {
                    return 29
                } else {
                    return 28
                }
            default:
                return 30
            }
        }
    }
    
    func advance(y: Int, m: Int, d: Int) {
        day += d
        month += m
        year += y
        
        while(month > 12) {
            year += 1
            month -= 12
        }
        
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            while (day > 31) {
                month += 1
                day -= 31
            }
            break
        case 2:
            if year % 100 == 0 || year % 400 == 0 || year % 4 == 0 {
                while (day > 29) {
                    month += 1
                    day -= 29
                }
                break
            } else {
                while (day > 28) {
                    month += 1
                    day -= 28
                }
                break
            }
        default:
            while (day > 30) {
                month += 1
                day -= 30
            }
            break
        }
        
        // In case month after add day larger than 12.
        while(month > 12) {
            year += 1
            month -= 12
        }
    }
    
    func print() -> String {
        if (normalize()) {
            return ("\(day)-\(month)-\(year)")
        }
        return "Date is invalid."
    }
}
