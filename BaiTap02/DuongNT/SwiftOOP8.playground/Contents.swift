import UIKit

class Date {
    private var day: Int
    private var month: Int
    private var year: Int
    
    init?(_ day: Int, _ month: Int, _ year: Int) {
        if day > 31 || day < 1 {
            return nil
        } else {
            self.day = day
        }
        if month > 12 || month < 1 {
            return nil
        } else {
            self.month = month
        }
        if year < 1 {
            return nil
        } else {
            self.year = year
        }
    }
    
    func daysIn(_ month: Int) -> Int? {
        if month > 12 || month < 1 {
            return nil
        } else {
            switch month {
            case 1, 3, 5, 7, 8, 10, 12:
                return 31
            case 4, 6, 9, 11:
                return 30
            case 2:
                if year % 4 == 0 {
                    return 29
                } else {
                    return 28
                }
            default:
                return 0
            }
        }
    }

    func prints() {
        print("Date is: \(day)/\(month)/\(year)")
    }
}

var date = Date(26, 01, 1996)
var dayIn = date?.daysIn(1)
if let date = date, let dayIn = dayIn {
    date.prints()
    print(dayIn)
} else {
    print("Date is error!!!")
}

