import UIKit

/**
 *  Date class
 **/
class Date {
    var day: Int
    var month: Int
    var year: Int
    init(_ day: Int,_ month: Int,_ year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func normalize() -> Bool {
        return day > 1 && day < 30 || month > 1 && month < 12 || year >= 1
    }
    
    func daysIn(_ month: Int) -> Int {
        guard normalize() else {
            return 0
        }
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 2:
            guard (year % 100 == 0 || year % 400 == 0 || year % 4 == 0) else {
                return 28
            }
            return 29
        default:
            return 30
        }
    }
    
    func advance(_ d: Int,_ m: Int,_ y: Int) {
        
    }
}

var date = Date(10, 10, 2019)
print("Days in this month: \(date.daysIn(date.month))")
