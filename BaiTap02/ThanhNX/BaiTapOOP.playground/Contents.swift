import UIKit
//print("Bai 1: ")
//class Fraction {
//    private(set) var tuSo: Double
//    private(set) var mauSo: Double
//
//    init?(tuSo: Double, mauSo: Double) {
//        self.tuSo = tuSo
//        if mauSo == 0 {
//            print("Error")
//            return nil
//        }
//        self.mauSo = mauSo
//    }
//
//    func findUCLN() -> Int {
//        var a = Fraction.self
//        var b = Fraction.self
//        while a != b {
//            if a > b {
//                a -= b
//            } else {
//                b -= a
//            }
//        }
//        return a
//    }
//
//    func rutGon() -> Int {
//        var i: Int = Int(findUCLN())
//
//    }
//
//    func sum(_ b: Fraction?) -> Fraction? {
//        guard let b = b else { return nil }
//        return Fraction(tuSo: tuSo * b.mauSo + b.tuSo * mauSo, mauSo: mauSo * b.mauSo)
//    }
//
//    func sub(_ b: Fraction?) -> Fraction? {
//        guard let b = b else { return nil }
//        return Fraction(tuSo: tuSo * b.mauSo - b.tuSo * mauSo, mauSo: mauSo * b.mauSo)
//    }
//
//    func mul(_ b: Fraction?) -> Fraction? {
//        guard let b = b else { return nil }
//        return Fraction(tuSo: tuSo * b.tuSo, mauSo: mauSo * b.mauSo)
//    }
//
//    func div(_ b: Fraction?) -> Fraction? {
//        guard let b = b else { return nil }
//        return Fraction(tuSo: tuSo * b.mauSo, mauSo: mauSo * b.tuSo)
//    }
//
//    func printFrac() -> String {
//        return "Phan so: \(tuSo) / \(mauSo)"
//    }
//}
//
//var a = Fraction(tuSo: 1, mauSo: 2)
//var b = Fraction(tuSo: 1, mauSo: 2)
////print(a?.findUCLN())
//print(a?.sum(b)?.printFrac())
//print(a?.sub(b)?.printFrac())
//print(a?.mul(b)?.printFrac())
//print(a?.div(b)?.printFrac())

print("Bai 2: ")
class daGiac {
    private var soCanh: Int
    private var arrCanh:[Int] = []
    init(soCanh: Int, arrCanh: [Int] = []) {
        self.soCanh = soCanh
        self.arrCanh = arrCanh
        if soCanh <= 2 {
            print("Khong phai da giac")
        }
    }
    
    func chuVi() -> Int {
        var cv = 0
        if soCanh != arrCanh.count {
            print("Nhap sai so canh")
        } else {
            for i in arrCanh {
                cv += i
            }
        }
        return cv
    }
}
var a = [1, 2, 3]
var b = daGiac(soCanh: 3, arrCanh: a)
print("Chu vi cua da giac la: \(b.chuVi())")
