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

print("Bai 4: ")
class TamGiac4 {
    private var a = 0.0
    private var b = 0.0
    private var c = 0.0

    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }

    fileprivate func isPythagoras() -> (dung: Bool,inMang: [Double]) {
        if a == sqrt(pow(b, 2) + pow(c, 2))
            || b == sqrt(pow(a, 2) + pow(c, 2))
            || c == sqrt(pow(b, 2) + pow(a, 2)) {
            return (true, [a, b, c])
        }
        return (false, [])
    }
}

var input: [TamGiac4] = [TamGiac4(a: 1, b: 2, c: 3),
                        TamGiac4(a: 2, b: 3, c: 4),
                        TamGiac4(a: 3, b: 4, c: 5)]

class CheckTamGiac {
    var tamGiacs: [TamGiac4]

    init(tamGiacs: [TamGiac4]) {
        self.tamGiacs = tamGiacs
    }

    func checkPytagoras(_ tg: [TamGiac4]) -> Void {
        tamGiacs.forEach { (tg) in
            let check = tg.isPythagoras()
            if check.dung {
                print(check.inMang)
            }
        }
    }
}

let checkTamGiac = CheckTamGiac(tamGiacs: input)
checkTamGiac.checkPytagoras(input)

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

print("Bai 6: ")
class HinhVe {
    fileprivate var pi = Double.pi
    fileprivate var a: Double
    fileprivate var b: Double

    init(_ a: Double,_ b: Double) {
        self.a = a
        self.b = b
    }
    func paintShape() {
        print("Hinh ve chua xac dinh")
    }
}

class HaiChieu: HinhVe {

    init(a: Double, b: Double) {
        super.init(a, b)
    }

    fileprivate func chuVi() -> Double {
        return a + b
    }

    fileprivate func dienTich() -> Double {
        return a * b
    }
}

class HinhTron: HaiChieu {
    private var r: Double
    init(a: Double, b: Double, r: Double) {
        self.r = r
        super.init(a: a, b: b)
    }

    override func paintShape() {
        print("Hinh Tron")
    }

    override func chuVi() -> Double {
        return r * 2 * pi
    }

    override func dienTich() -> Double {
        return pow(r, 2) * pi
    }
}

class HinhVuong: HaiChieu {
    override init(a: Double, b: Double) {
        super.init(a: a, b: b)
    }

    override func paintShape() {
        print("Hinh Vuong")
    }

    override func chuVi() -> Double {
        return a * 4
    }

    override func dienTich() -> Double {
        return a * b
    }
}

class TamGiac6: HaiChieu {
    private var c: Double
    init(a: Double, b: Double, c: Double) {
        self.c = c
        super.init(a: a, b: b)
    }

    override func paintShape() {
        print("Hinh Tam Giac")
    }

    override func chuVi() -> Double {
        return a + b + c
    }

    override func dienTich() -> Double {
        return sqrt(((a + b + c) / 2) * (((a + b + c) / 2) - a) * (((a + b + c) / 2) - b) * (((a + b + c) / 2) - c))
    }
}

class BaChieu: HinhVe {
    fileprivate var c: Double

    init(_ a: Double,_ b: Double,_ c: Double) {
        self.c = c
        super.init(a, b)
    }

    fileprivate func dienTich() -> Double {
        return a * b * c
    }

    fileprivate func theTich() -> Double {
        return pow(a, 2) * pow(b, 2) * pow(c, 2)
    }
}

class HinhCau: BaChieu {
    private var r: Double
    init(a: Double, b: Double, c: Double, r: Double) {
        self.r = r
        super.init(a, b, c)
    }

    override func paintShape() {
        print("Hinh Cau")
    }

    override func dienTich() -> Double {
        return 4 * pi * pow(r, 2)
    }

    override func theTich() -> Double {
        return (4 * pi * pow(r, 3)) / 3
    }
}

class LapPhuong: BaChieu {
    init(a: Double, b: Double, c: Double) {
        super.init(a, b, c)
    }

    override func paintShape() {
        print("Hinh Lap Phuong")
    }

    override func dienTich() -> Double {
        return 6 * pow(a, 2)
    }

    fileprivate func dienTichXungQuanh() -> Double {
        return 4 * pow(a, 2)
    }

    override func theTich() -> Double {
        return pow(a, 3)
    }
}

var ht = HinhTron(a: 0, b: 0, r: 5)
print("Chu vi hinh tron: \(ht.chuVi())")
print("Dien tich hinh tron: \(ht.dienTich())")

var hv = HinhVuong(a: 5, b: 5)
print("Chu vi hinh vuong: \(hv.chuVi())")
print("Dien tich hinh vuong: \(hv.dienTich())")

var tg = TamGiac6(a: 5, b: 6, c: 7)
print("Chu vi tam giac: \(tg.chuVi())")
print("Dien tich tam giac: \(tg.dienTich())")

var hc = HinhCau(a: 0, b: 0, c: 0, r: 5)
print("Dien tich hinh cau: \(hc.dienTich())")
print("The tich hinh cau: \(hc.theTich())")

var lp = LapPhuong(a: 5, b: 5, c: 5)
print("Dien tich toan phan hinh lap phuong: \(lp.dienTich())")
print("Dien tich xung quanh hinh lap phuong: \(lp.dienTichXungQuanh())")
print("The tich hinh lap phuong: \(lp.theTich())")

print("Bai 7: ")

class Student {
    fileprivate var fullName: String
    fileprivate var birthDay: Int
    fileprivate var totalScore: Double
    
    init(fullName: String, birthDay: Int, totalScore: Double) {
        self.fullName = fullName
        self.birthDay = birthDay
        self.totalScore = totalScore
    }
}

class ClassManager {
    private var students: [Student] = []
    
    init(students: [Student]) {
        self.students = students
    }
    
    fileprivate func bubbleSort() -> [Student] {
        var arr: [Student] = students
        for i in 0..<arr.count {
            for j in 1..<arr.count - i {
                if arr[j].totalScore < arr[j - 1].totalScore {
                    let tmp = arr[j - 1]
                    arr[j - 1] = arr[j]
                    arr[j] = tmp
                } else if arr[j].totalScore == arr[j - 1].totalScore {
                    for i in 0..<arr.count {
                        for j in 1..<arr.count - i {
                            if arr[j].birthDay < arr[j - 1].birthDay {
                                let tmp = arr[j - 1]
                                arr[j - 1] = arr[j]
                                arr[j] = tmp
                            }
                        }
                    }
                }
            }
        }
        return arr
    }
}

var st1 = Student(fullName: "nguyen xuan thanh", birthDay: 1996, totalScore: 9)
var st2 = Student(fullName: "bui van thanh", birthDay: 1999, totalScore: 8)
var st3 = Student(fullName: "tran thi kim thoa", birthDay: 1998, totalScore: 8)

var sts = [st1, st2, st3]
var lop1 = ClassManager(students: sts)
var x = lop1.bubbleSort()
x.forEach { (st) in
    print(st.fullName)
}

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


print("Bai 9: ")

class MangMotChieu {
    fileprivate var mang1Chieu: [Int]
    
    init(mang1Chieu: [Int]) {
        self.mang1Chieu = mang1Chieu
    }
    
    fileprivate func printMang1Chieu() -> Void {
        for value in mang1Chieu {
            print(value)
        }
    }
    
    private var max = 0
    private var min = 9
    
    fileprivate func printMinMax() -> (Int, Int) {
        for value in mang1Chieu {
            if max < value {
                max = value
            }
        }
        for value in mang1Chieu {
            if min > value {
                min = value
            }
        }
        return (min, max)
    }
}

var m = MangMotChieu(mang1Chieu: [5, 2, 3, 4, 9])
print("Mang 1 chieu: \(m.printMang1Chieu())")
print("Min max: \(m.printMinMax())")
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
