import UIKit


//BaiTap 01
//class PhanSo {
//    private(set) var tuSo: Double
//    private(set) var mauSo: Double
//
//    init?(_ tuSo: Double, _ mauSo: Double) {
//    self .tuSo = tuSo
//        if mauSo == 0 {
//            print("khong phai phan so")
//            return nil
//        } else {
//            self .mauSo = mauSo
//}
//    }
//        func taoPhanSo() -> Double {
//            return (tuSo / mauSo)
//}
//
//        func congPhanSo(_ b: PhanSo?) -> Double? {
//            guard let c = b else {return nil}
//            return ((tuSo * c.mauSo + c.tuSo * mauSo) / (mauSo * c.mauSo))
//}
//
//        func truPhanSo(_ b: PhanSo?) -> Double? {
//            guard let c = b else {return nil}
//            return ((tuSo * c.mauSo - c.tuSo * mauSo) / (mauSo * c.mauSo))
//}
//
//        func nhanPhanSo(_ b: PhanSo?) -> Double? {
//            guard let c = b else {return nil}
//            return ((tuSo * c.tuSo) / (mauSo * c.mauSo))
//}
//
//        func chiaPhanSo(_ b: PhanSo?) -> Double? {
//            guard let c = b else {return nil}
//            return ((tuSo * c.mauSo) / (mauSo * c.tuSo))
//}
//    }
//
//var a = PhanSo(1, 5)
//var c = PhanSo(2, 3)
//a?.congPhanSo(c)
//a?.truPhanSo(c)
//a?.nhanPhanSo(c)
//a?.chiaPhanSo(c)


////BaiTap02
//class DaGiac {
//    var soCanh: Int?
//    var kichThuocCanh: [Int]
//
//    init?(_ soCanh: Int, _ kichThuocCanh: [Int]) {
//        if soCanh == 3 {
//            self.soCanh = soCanh
//        } else if soCanh != kichThuocCanh.count {
//            print("nhap sai so canh")
//            return nil
//        } else {
//            print("khong phai da giac")
//            return nil
//        }
//            self.kichThuocCanh = kichThuocCanh
//    }
//
//        func tinhChuVi() -> Int {
//            var chuVi = 0
//            for i in kichThuocCanh {
//                chuVi += i
//            }
//            print("Chu vi da giac la \(chuVi)")
//            return chuVi
//        }
//}
//
//var a = [1, 2, 3]
//var b = DaGiac(3, a)
//b?.tinhChuVi()
//
//
////BaiTap03
//class TamGiac : DaGiac {
//
//    override init?(_ soCanh: Int,_ kichThuocCanh: [Int]) {
//        super.init(soCanh, kichThuocCanh)
//        let a = kichThuocCanh[0]
//        let b = kichThuocCanh[1]
//        let c = kichThuocCanh[2]
//
//        func isTriangle() -> Bool {
//            if (a + b > c) || (a + c > b) || (b + c > a) {
//                print("day la tam giac")
//                return true
//            } else {
//                print("day khong phai la tam giac")
//                return false
//            }
//        }
//    }
//
//    func tinhDienTich() -> Double {
//        let nuaChuVi = (Double(tinhChuVi()) / 2)
//        let a = kichThuocCanh[0]
//        let b = kichThuocCanh[1]
//        let c = kichThuocCanh[2]
//
//        let d = nuaChuVi - Double(a)
//        let e = nuaChuVi - Double(b)
//        let f = nuaChuVi - Double(c)
//        let dienTich = sqrt(nuaChuVi * d * e * f)
//        print("dien tich tam giac la \(dienTich)")
//        return dienTich
//
//    }
//}
//let tamGiac = TamGiac(3, [4, 5, 6])
//tamGiac?.tinhChuVi()
//tamGiac?.tinhDienTich()

////Baitap 10
//class A {
//    var soHang: Int
//    init?(_ soHang: Int ) {
//        if soHang < 0 {
//            print ("Day khong phai la so nguyen duong")
//            return nil
//        } else {
//            self.soHang = soHang
//        }
//}
//    func tinhTong() -> Int {
//        var tong = 0
//        for i in 1...soHang {
//          tong += i
//        }
//        print("Tong gia tri trong lop A la \(tong)")
//        return tong
//}
//}
//var a = A(100)
//a?.tinhTong()

////Baitap 09
//class Mang1c {
//    var array = [Int]()
//    init(_ array: [Int]) {
//        self.array = array
//    }
//
//    func findMinMax(arr: [Int]) -> (maxNumber: Int, minNumber: Int) {
//        var maxNumber = arr[0]
//        var minNumber = arr[0]
//
//        for i in 1..<arr.count {
//            if arr[i] < minNumber {
//                minNumber = arr[i]
//            } else if arr[i] > maxNumber {
//                maxNumber = arr[i]
//            }
//        }
//        print("Max number is \(maxNumber), Min number is \(minNumber)")
//        return (maxNumber, minNumber)
//    }
//}
//
//var a = Mang1c([1, 4, 10])
//a.findMinMax(arr: [1, 4, 10])

////Baitap 05
//class Stack {
//    var myStack = [Int]()
//    var number: Int
//    init?(myStack: [Int], number: Int) {
//        self.number = number
//        if myStack.count == 0 {
//            print("Stack is empty")
//            return nil
//        } else {
//        self.myStack = myStack
//        }
//    }
//
//    func push() -> [Int] {
//        self.myStack.append(number)
//        return myStack
//    }
//
//    func pop() -> [Int] {
//        self.myStack.removeLast()
//        return myStack
//    }
//}
//if let a = Stack(myStack: [], number: 5) {
//print("The stack after push \(a.push())")
//print("The stack after pop \(a.pop())")
//}

//BaiTap 06
//class HinhVe {
//   var x: Double = 0.0
//   var y: Double = 0.0
//    var pi: Double = Double.pi
//
//    init(_ chieuDai: Double,_ chieuRong: Double) {
//       x = chieuDai
//       y = chieuRong
//    }
//
//    func kieuHinhVe() {
//        print(" ")
//    }
//    
//    func chuVi() -> Double {
//        return x
//    }
//
//    func dienTich() -> Double {
//        return y
//    }
//
//    func theTich() -> Double {
//        return 0.0
//    }
//}
//class HaiChieu : HinhVe {
//    override func kieuHinhVe() {
//        print("Hinh Hai Chieu")
//    }
//    override func chuVi() -> Double {
//        return x + x
//    }
//    override func dienTich() -> Double {
//        return x * y
//    }
//}
//
//class HinhTron : HaiChieu {
//    private(set) var r: Double
//    init(_ chieuDai: Double,_ chieuRong: Double,_ banKinh: Double) {
//        self.r = banKinh
//        super.init(x, y)
//    }
//
//    override func chuVi() -> Double {
//        return r * 2 * pi
//    }
//    
//    override func dienTich() -> Double {
//        return pow(r, 2) * pi
//    }
//}
//
//class HinhVuong : HaiChieu {
//    override func chuVi() -> Double {
//            return 4 * x
//    }
//        
//    override func dienTich() -> Double {
//            return x * x
//    }
//}
//
//class TamGiac : HaiChieu {
//    private(set) var c: Double
//    init(_ a: Double,_ b: Double,_ c: Double) {
//        self.c = c
//        super.init(a, b)
//    }
//
//    override func chuVi() -> Double {
//        return x + y + c
//    }
//
//    override func dienTich() -> Double {
//        return sqrt((chuVi() / 2) * ((chuVi() / 2) - x) * ((chuVi() / 2 ) - y) * ((chuVi() / 2) - c))
//    }
//}
//
//class BaChieu : HinhVe {
//    override func kieuHinhVe() {
//        print("Hinh Ba Chieu")
//    }
//}
//
//class HinhCau: BaChieu {
//    private(set) var r: Double
//    init(_ chieuDai: Double,_ chieuRong: Double,_ banKinh: Double) {
//        self.r = banKinh
//        super.init(chieuDai, chieuRong)
//    }
//
//    override func dienTich() -> Double {
//        return 4 * pi * pow(r, 2)
//    }
//    
//    override func theTich() -> Double {
//        return (4 / 3) * pi * pow(r, 3)
//    }
//}
//
//class HinhLapPhuong : BaChieu {
//    private(set) var c: Double
//    init(_ a: Double,_ b: Double,_ c: Double) {
//        super.init(a, b)
//        self.c = c
//    }
//
//    override func dienTich() -> Double {
//        print("Dien tich toan phan hinh lap phuong \(6 * pow(x, 2))")
//        return 6 * pow(x, 2)
//    }
//
//    func dienTichXungQuanh() -> Double {
//        print("Dien tich xung quanh hinh lap phuong \(4 * pow(x, 2))")
//        return 4 * pow(x, 2)
//    }
//
//    override func theTich() -> Double {
//        print("The tich hinh lap phuong \(x * x * x)")
//        return (x * x * x)
//    }
//}
//
//var a = HinhCau(2, 2, 3)
//a.dienTich()

////BaiTap 07

class Student {
    fileprivate var fullName: String
    fileprivate var dOB: Int
    fileprivate var totalScore: Double = 0.0

    init(fullName: String, dOB: Int, totalScore: Double) {
        self.fullName = fullName
        self.dOB = dOB
        self.totalScore = totalScore
    }
}

class ClassManager {
    private var students: [Student] = []

    init(students: [Student]) {
        self.students = students
    }

    func sort() -> [Student] {
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
                            if arr[j].dOB < arr[j - 1].dOB {
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

var st1 = Student(fullName: "tuan anh", dOB: 1996, totalScore: 9.0)
var st2 = Student(fullName: "thanh Tu", dOB: 1999, totalScore: 8.5)
var st3 = Student(fullName: "minh Vu", dOB: 1998, totalScore: 8.0)

var sts = [st1, st2, st3]
var lop = ClassManager(students: sts)
var x = lop.sort()
x.forEach { (st) in
    print(st.fullName)
}

////BaiTap08
//
//class Date {
//    var days: Int
//    var months: Int
//    var years: Int
//
//    init(_ days: Int,_ months: Int,_ years: Int) {
//        self.days = days
//        self.months = months
//        self.years = years
//    }
//    func check() -> [Int]?{
//         if years >= 1 && months <= 12 && months >= 1 && days >= 1 && days <= 31 {
//             if months == 1 || months == 3 || months == 5 || months == 7 || months == 8 || months == 10 || months == 12 && days <= 31 {
//    //            self.days = days
//    //            self.months = months
//    //            self.years = years
//                 print("Correct")
//            } else if months == 4 || months == 6 || months == 9 || months == 11 && days <= 30 {
//    //            self.days = days
//    //            self.months = months
//    //            self.years = years
//                 print("Correct")
//            } else if months == 2 && days == 29 || days == 28 {
//                print("Correct")
//            } else {
//                print("Wrong")
//                return nil
//            }
//        }
//            return [days, months, years]
//    }
//
//
////var date = Date(31, 1, 1997)
////date.check()
//    func daysln () -> Int {
//        if months == 1 || months == 3 || months == 5 || months == 7 || months == 8 || months == 10 || months == 12 && days <= 31 {
//            print("This month has 31 days")
//        } else if months == 4 || months == 6 || months == 9 || months == 11 && days <= 30 {
//            print("This month has 30 days")
//        } else if years % 4 == 0 && months == 2 && days <= 29 {
//            print("This month has 29 days")
//        } else if months == 2 && days <= 28 {
//            print("This month has 28 days")
//        } else {
//            print("Correct Day")
//        }
//        return days
//    }
//
//    func advanceDay() {
//        if months == 1 || months == 3 || months == 5 || months == 7 || months == 8 || months == 10 || months == 12 && days <= 31 {
//            if days + 1 > 31 {
//                print("The next day is 1 / \(months + 1) / \(years)")
//            } else {
//                print("The next day is \(days + 1) / \(months) / \(years)")
//            }
//        } else if months == 4 || months == 6 || months == 9 || months == 11 && days <= 30 {
//            if days + 1 > 30 {
//                 print("The next day is 1 / \(months + 1) / \(years)")
//            } else {
//                 print("The next day is \(days + 1) / \(months) / \(years)")
//            }
//        } else if years % 4 == 0 && months == 2 && days <= 29 {
//            if days + 1 > 29 {
//                 print("The next day is 1 / \(months + 1) / \(years)")
//            } else {
//                 print("The next day is \(days + 1) / \(months) / \(years)")
//            }
//        } else if months == 2 && days <= 28 {
//            if days + 1 > 28 {
//                 print("The next day is 1 / \(months + 1) / \(years)")
//            } else {
//                 print("The next day is \(days + 1) / \(months) / \(years)")
//            }
//        } else {
//        }
//    }
//}
//var date = Date (28, 2, 1997)
//date.check()
//date.daysln()
//date.advanceDay()


//BaiTap04
class Triangle {
    var a: Double
    var b: Double
    var c: Double
    
    init?(a: Double, b: Double, c: Double) {
    self.a = a
    self.b = b
    self.c = c
    }
    func checkPytago() -> (checkBool: Bool, arr: [Double]) {
        if a  == sqrt(pow(b, 2) + pow(c, 2)) || b == sqrt(pow(a, 2) + pow(c, 2)) || c == sqrt(pow(a, 2) + pow(c, 2)) {
            return (true, [a, b, c])
        }
        return (false, [])
    }
}
    class Print {
        var arrTriangle = [Triangle]()
        
        init(_ arrayTriangle: [Triangle]) {
            arrTriangle = arrayTriangle
}
        func output (_ tG: [Triangle]) -> Void {
            arrTriangle.forEach{ (tG) in
                let check = tG.checkPytago()
                if check.checkBool {
                    print(check.arr)
                }
            }
    }
}




