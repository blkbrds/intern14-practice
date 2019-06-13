import UIKit
print("Bai 1: ")
class Fraction {
    private(set) var tuSo: Double
    private(set) var mauSo: Double

    init?(tuSo: Double, mauSo: Double) {
        self.tuSo = tuSo
        if mauSo == 0 {
            print("Error Fraction")
            return nil
        }
        self.mauSo = mauSo
    }

    func findUCLN(_ num1: Double, _ num2: Double) -> Double {
        var a: Double = abs(num1)
        var b: Double = abs(num2)
        if a == 0 && b == 0 {
            return 0
        } else {
            while a != b {
                if a > b {
                    a -= b
                } else {
                    b -= a
                }
            }
        }
        return a
    }

    func sum(_ b: Fraction?) -> Fraction? {
        guard let b = b else { return nil }
        return Fraction(tuSo: tuSo * b.mauSo + b.tuSo * mauSo, mauSo: mauSo * b.mauSo)
    }

    func sub(_ b: Fraction?) -> Fraction? {
        guard let b = b else { return nil }
        return Fraction(tuSo: tuSo * b.mauSo - b.tuSo * mauSo, mauSo: mauSo * b.mauSo)
    }

    func mul(_ b: Fraction?) -> Fraction? {
        guard let b = b else { return nil }
        return Fraction(tuSo: tuSo * b.tuSo, mauSo: mauSo * b.mauSo)
    }

    func div(_ b: Fraction?) -> Fraction? {
        guard let b = b else { return nil }
        return Fraction(tuSo: tuSo * b.mauSo, mauSo: mauSo * b.tuSo)
    }

    func printFrac() -> String {
        return "Phan so: \(tuSo / findUCLN(tuSo, mauSo)) / \(mauSo / findUCLN(tuSo, mauSo))"
    }
}

var a = Fraction(tuSo: 1, mauSo: 2)
var b = Fraction(tuSo: 3, mauSo: 4)

print("Cong phan so ")
if let ps1 = a, let ps2 = b {
    if let sum = ps1.sum(ps2) {
        print(sum.printFrac())
    }
}

print("Tru phan so ")
if let ps1 = a, let ps2 = b {
    if let sub = ps1.sub(ps2) {
        print(sub.printFrac())
    }
}

print("Nhan phan so")
if let ps1 = a, let ps2 = b {
    if let mul = ps1.mul(ps2) {
        print(mul.printFrac())
    }
}

print("Chia phan so")
if let ps1 = a, let ps2 = b {
    if let div = ps1.div(ps2) {
        print(div.printFrac())
    }
}

print("Bai 2: ")
class DaGiac {
    fileprivate var soCanh: Double = 0
    fileprivate var arrCanh:[Double] = []
    init(soCanh: Double, arrCanh: [Double] = []) {
        self.soCanh = soCanh
        guard soCanh <= 2 else {
            self.arrCanh = arrCanh
            return
        }
    }

    fileprivate func chuVi() -> Double {
        var cv = 0.0
        guard !arrCanh.contains(0.0) || soCanh > 2 || soCanh == Double(arrCanh.count) else {
            print("Khong phai da giac, hoac nhap sai so canh")
            return cv
        }
        for value in arrCanh {
            if value == 0 {
                cv = 0.0
                print("Khong the co canh bang 0")
                break
            } else {
                cv += value
            }
        }
        return cv
    }

    fileprivate func printCanh() -> Void {
        for value in arrCanh {
            print("Canh cua da giac: \(value)")
        }
    }
}

var f = DaGiac(soCanh: 4, arrCanh: [1.0, 5.0, 3.0, 4.0])

f.printCanh()
print("Chu vi cua da giac la: \(f.chuVi())")

print("Bai 3: ")
class TamGiac: DaGiac {
    var cv = 0.0
    override func chuVi() -> Double {
        if soCanh != Double(arrCanh.count) {
            print("Nhap sai so canh")
        } else if soCanh != 3 {
            print("Khong phai tam giac")
        } else {
            for i in arrCanh {
                cv += i
            }
        }
        return cv
    }

    fileprivate func dienTich() -> Double {
        var s = 1.0
        let p: Double = (arrCanh[0] + arrCanh[1] + arrCanh[2]) / 2
        if soCanh != 3 {
            print("Khong phai tam giac")
        } else {
            s = sqrt(p * (p - arrCanh[0]) * (p - arrCanh[1]) * (p - arrCanh[2]))
        }
        return s
    }
}

var d = TamGiac(soCanh: 3, arrCanh: [9.0, 5.0, 6.0])
print("Dien Tich Tam Giac la : \(d.dienTich())")

//print("Bai 4: ")
//class TamGiac4 {
//    private var a = 0.0
//    private var b = 0.0
//    private var c = 0.0
//
//    init(a: Double, b: Double, c: Double) {
//        self.a = a
//        self.b = b
//        self.c = c
//    }
//
//    func isPythagoras() -> (Bool, [Double]) {
//        if a == sqrt(pow(b, 2) + pow(c, 2))
//            || b == sqrt(pow(a, 2) + pow(c, 2))
//            || c == sqrt(pow(b, 2) + pow(a, 2)) {
//            return (true, [a, b, c])
//        }
//        return (false, [])
//    }
//}
//
//var input: [TamGiac4] = [TamGiac4(a: 1, b: 2, c: 3),
//                        TamGiac4(a: 2, b: 3, c: 4),
//                        TamGiac4(a: 3, b: 4, c: 5)]
//
//class CheckTamGiac {
//    var tamGiacs: [TamGiac4]
//
//    init(tamGiacs: [TamGiac4]) {
//        self.tamGiacs = tamGiacs
//    }
//
//    func checkPytagoras(_ tg: [TamGiac4]) -> Void {
////        for tamG in tamGiacs {
////            let check = tamG.isPythagoras()
////            if check.0 {
////                print(check.1)
////            }
////        }
//        tamGiacs.forEach { (tg) in
//            let check = tg.isPythagoras()
//            if check.0 {
//                print(check.1)
//            }
//        }
//    }
//}
//class InputTamGiac {
//    fileprivate var arrTamGiac: [[Double]] = []
//
//    init(arrTamGiac: [Double] = [], arrCanhTG: [Double] = []) {
//        self.arrTamGiac = arrTamGiac
//        guard arrCanhTG.count != 3 else {
//            self.arrCanhTG = arrCanhTG
//            return
//        }
//    }
//
//    fileprivate func isPythagoras(_ arr: [Double] = []) -> Bool {
//        if arr.count != 3 {
//            return false
//        } else {
//            if arr[0] == sqrt(pow(arr[1], 2) + pow(arr[2], 2))
//                || arr[1] == sqrt(pow(arr[0], 2) + pow(arr[2], 2))
//                || arr[2] == sqrt(pow(arr[1], 2) + pow(arr[0], 2)) {
//                return true
//            }
//        }
//        return true
//    }
//
//    fileprivate func printCanhTG () -> Void {
//        for index in arrTamGiac {
//            for value in arrCanhTG {
//                if isPythagoras(arrCanhTG) == true {
//                    print("Canh cua tam giac thoa man Pytago: \(arrCanhTG[value])")
//                }
//            }
//        }
//    }
//}
//print("Bai 8: ")
//class Date {
//    fileprivate var day: Int = 1
//    fileprivate var month: Int = 1
//    fileprivate var year: Int = 1
//
//    init(day: Int, month: Int, year: Int) {
//        self.day = day
//        self.month = month
//        self.year = year
//    }
//
//    func normalize() -> Bool {
//        if day >= 1 && day <= 30 {
//            if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) && month == 2 {
//                day <= 29
//                return true
//            }
//            return true
//        } else {
//            return false
//        }
//
//        if month >= 1 && month <= 12 {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func daysln() -> Int {
//        switch month {
//        case 1:
//            return 31
//        case 2:
//            guard (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 else {
//                return 28
//            }
//            return 29
//        case 3:
//            return 31
//        case 4:
//            return 30
//        case 5:
//            return 31
//        case 6:
//            return 30
//        case 7:
//            return 31
//        case 8:
//            return 31
//        case 9:
//            return 30
//        case 10:
//            return 31
//        case 11:
//            return 30
//        case 12:
//            return 31
//        default:
//            return 0
//        }
//    }
//}
//
print("Bai 5: ")
struct CStack {
    fileprivate var arrStack : [Int] = [1, 2, 3]
    fileprivate var maxStack = 5

    func isEmpty() -> Bool {
        return arrStack.isEmpty
    }

    func isFull() -> Bool {
        return arrStack.count == maxStack
    }

    mutating func push(_ element: Int) {
        if !isFull() {
            arrStack.append(element)
        } else {
            print("Stack Full")
        }
    }

    mutating func pop() -> Int? {
        return arrStack.popLast()
    }
}
var stack = CStack()
stack.isEmpty()
stack.isFull()
stack.push(4)
stack.push(5)
stack.push(6)
print(stack.arrStack)
stack.isFull()
stack.pop()
print(stack.arrStack)

print("Bai 9: ")

class MangMotChieu {
    
}

print("Bai 10:")
class A {
    fileprivate var n: Int
    init(n: Int) {
        self.n = n
    }
    func sumA() -> Int {
        var sum: Int = 0
        for i in 1...n {
            sum += i
        }
        return sum
    }
}

var n = A(n: 100)
print("Tong S tu 1 den n la: \(n.sumA())")
