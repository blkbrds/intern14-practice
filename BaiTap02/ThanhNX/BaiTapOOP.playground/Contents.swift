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
    fileprivate var soCanh: Double
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
}

var e = [1.0, 5.0, 3.0, 4.0]
var f = DaGiac(soCanh: 4, arrCanh: e)
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
            s = sqrt(p * (p - arrCanh[0]) * (p - arrCanh[1]) * (p - arrCanh[1]))
        }
        return s
    }
}

var c = [5.0, 6.0, 0.0]
var d = TamGiac(soCanh: 3, arrCanh: c)
print("Dien Tich Tam Giac la : \(d.dienTich())")

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
