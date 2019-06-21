import UIKit

// Baitap 1
class PhanSo {
    private(set) var tuSo: Double
    private(set) var mauSo: Double

    init?(_ tuSo: Double, _ mauSo: Double) {
        self.tuSo = tuSo
        if mauSo == 0 {
            print("Khong thuc hien duoc phep tinh")
            return nil
        } else {
            self.mauSo = mauSo
        }
    }

    func phanSo() -> Double {
        return (tuSo / mauSo)
    }

    func cong(_ b: PhanSo?) -> Double? {
        guard let b = b else { return nil }
        return ((tuSo * b.mauSo + b.tuSo * mauSo) / (mauSo * b.mauSo))
    }

    func tru(_ b: PhanSo?) -> Double? {
        guard let b = b else { return nil }
        return ((tuSo * b.mauSo - b.tuSo * mauSo) / (mauSo * b.mauSo))
    }

    func nhan(_ b: PhanSo?) -> Double? {
        guard let b = b else { return nil }
        return ((tuSo * b.tuSo) / (mauSo * b.mauSo))
    }

    func chia(_ b: PhanSo?) -> Double? {
        guard let b = b else { return nil }
        return ((tuSo * b.mauSo) / (mauSo * b.tuSo))
    }

    func printFrac() -> String {
        return "Phan so: \(tuSo) / \(mauSo)"
    }
}

var a = PhanSo(1, 2)
var b = PhanSo(2, 3)
var c = a?.chia(b)
print()
a?.tru(b)
a?.nhan(b)
a?.chia(b)


// Baitap 2
class DaGiac {
    private var soCanh: Int?
    private var kichThuocCacCanh: [Int]

    init?(_ soCanh: Int, _ kichThuocCacCanh: [Int]) {
        self.kichThuocCacCanh = kichThuocCacCanh
        if soCanh <= 2 {
            print("Da giac phai co so canh lon hon 2")
            return nil
        }
        self.soCanh = soCanh
    }

    func chuVi() {
        var tong = 0
        if soCanh != kichThuocCacCanh.count {
            print("nhap sai so canh")
        } else {
            for i in kichThuocCacCanh {
                tong += i
            }
            print("Cac canh cua da giac la: \(kichThuocCacCanh) va Chu vi cua da giac la: \(tong)")
        }
    }
}
var a = [1, 2, 3, 5]
var b = DaGiac(4, a)
b?.chuVi()


// Baitap 3
class TamGiac: DaGiac {
    private var soCanh = 3
    private var kichThuocCacCanh: [Int]


    override init?(_ soCanh: Int = 3, _ kichThuocCacCanh: [Int]) {
        self.kichThuocCacCanh = kichThuocCacCanh
        let canh1 = kichThuocCacCanh[0]
        let canh2 = kichThuocCacCanh[1]
        let canh3 = kichThuocCacCanh[2]
        super.init(soCanh, kichThuocCacCanh)
        
        if soCanh != 3 {
            print("Tam giac chi co 3 canh")
            return nil
        } else if (canh1 + canh2 <= canh3) {
            print("Tong 2 canh bat ki cua tam giac phai lon hon canh con lai")
            return nil
        } else if (canh1 + canh3 <= canh2) {
            print("Tong 2 canh bat ki cua tam giac phai lon hon canh con lai")
            return nil
        } else if (canh2 + canh3 <= canh1) {
            print("Tong 2 canh bat ki cua tam giac phai lon hon canh con lai")
            return nil
        } else {
            self.soCanh = 3
        }
    }

    override func chuVi() {
        super.chuVi()
    }
    
    func dienTich() -> Double {
        let canh1 = kichThuocCacCanh[0]
        let canh2 = kichThuocCacCanh[1]
        let canh3 = kichThuocCacCanh[2]
        let p = Double((canh1 + canh2 + canh3) / 2)
        let p1 = p - Double(canh1)
        let p2 = p - Double(canh2)
        let p3 = p - Double(canh3)
        let area = sqrt(p * p1 * p2 * p3)

        return area
    }
}
var c = [4, 5, 6]
var d = TamGiac(3, c)
d?.chuVi()
d?.dienTich()


// Baitap 10
class ClassA {
    private var n: Int

    init(_ n: Int) {
        self.n = n
    }

    func sum() -> Int {
        var tong = 0
        for i in 1...n {
            tong += i
        }
        return tong
    }
}
var s = ClassA(100)
print("Tong cac so nguyen duong tu 1 den n la: \(s.sum())")


// Baitap 5
class CStack {
    var array: [Int] = [1, 2, 3]

    func isEmpty() -> Bool {
        return array.isEmpty
    }

    func isFull() -> Bool {
        let top = array.count
        if top == 0 {
            return false
        } else {
            return true
        }
    }

    func push(_ a: Int) {
       array.append(a)
    }

    func pop() -> Int? {
        return array.popLast()
    }

    func count() -> Int {
        return array.count
    }

}
var stack = CStack()
stack.isEmpty()
stack.count()
stack.push(4)
stack.pop()
stack.isFull()
print(stack.array)


// Baitap 6
class HinhVe {
    fileprivate var a: Double
    fileprivate var b: Double

    init(_ a: Double, _ b: Double) {
        self.a = a
        self.b = b
    }

    func hinhVe() -> String {
        return "Chua xac dinh duoc hinh ve"
    }
}

class HaiChieu: HinhVe {
    override init(_ a: Double, _ b: Double) {
        super.init(a, b)
    }

    func chuVi() -> Double {
        return 0
    }

    func dienTich() -> Double {
        return 0
    }
}

class HinhTron: HaiChieu {
    private var r: Double

    init(_ a: Double, _ b: Double, _ r: Double) {
        self.r = r
        super.init(a, b)
    }

    override func hinhVe() -> String {
        return "Hinh Tron"
    }

    override func chuVi() -> Double {
        return (2 * Double.pi * r)
    }

    override func dienTich() -> Double {
        return (Double.pi * pow(r, 2))
    }
}

class HinhVuong: HaiChieu {
    override init(_ a: Double, _ b: Double) {
        super.init(a, b)
    }

    override func hinhVe() -> String {
        return "Hinh Vuong"
    }

    override func chuVi() -> Double {
        return (a * 4)
    }

    override func dienTich() -> Double {
        return pow(a, 2)
    }
}

class HinhTamGiac: HaiChieu {
    private var c: Double

    init(_ a: Double, _ b: Double, _ c: Double) {
        self.c = c
        super.init(a, b)
    }

    override func hinhVe() -> String {
        return "Hinh Tam Giac"
    }

    override func chuVi() -> Double {
        return (a + b + c)
    }

    override func dienTich() -> Double {
        let p = (a + b + c) / 2

        return sqrt(p * (p - a) * (p - b) * (p - c))
    }
}

class BaChieu: HinhVe {
    private var c: Double

    init(_ a: Double, _ b: Double, _ c: Double) {
        self.c = c
        super.init(a, b)
    }

    func dienTich() -> Double {
        return 0
    }

    func theTich() -> Double {
        return 0
    }
}

class HinhCau: BaChieu {
    override init(_ a: Double, _ b: Double, _ c: Double) {
        super.init(a, b, c)
    }

    override func hinhVe() -> String {
        return "Hinh Cau"
    }

    override func dienTich() -> Double {
        return (4 * Double.pi * pow(a, 2))
    }

    override func theTich() -> Double {
        return (4 / 3) * Double.pi * pow(a, 3)
    }
}

class HinhLapPhuong: BaChieu {
    override init(_ a: Double, _ b: Double, _ c: Double) {
        super.init(a, b, c)
    }

    override func hinhVe() -> String {
        return "Hinh Lap Phuong"
    }

    override func dienTich() -> Double {
        return (6 * pow(a, 2))
    }

    override func theTich() -> Double {
        return pow(a, 3)
    }
}


// Baitap 9
class Mang1c {
    private var array: [Int]

    init(_ array: [Int]) {
        self.array = array
    }

    func printArray() -> Int {
        for i in array {
            print(i)
        }
        return 0
    }

    private var max = 0
    private var min = 9

    func printMaxMin () -> (Int, Int) {
        for i in array {
            if max < i {
                max = i
            }
        }
        for i in array {
            if min > i {
                min = i
            }
        }
        return (max, min)
    }
}
var c = [1, 2, 3, 5, 7]
var d = Mang1c(c)
d.printArray()
print(d.printMaxMin())


// Baitap 4
class TamGiac {
    private var a: Double
    private var b: Double
    private var c: Double

    init(_ a: Double, _ b: Double, _ c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }

    fileprivate func isPytago() -> (check: Bool, printArray: [Double]) {
        if a == sqrt(pow(b, 2) + pow(c, 2)) || b == sqrt(pow(a, 2) + pow(c, 2)) || c == sqrt(pow(a, 2) + pow(b, 2)) {
            return (true, [a, b, c])
        }
        return (false, [])
    }
}

class TamGiacThoaPytago {
    private var tamGiac: [TamGiac]

    init(_ tamGiac: [TamGiac]) {
        self.tamGiac = tamGiac
    }

    func checkPytago(_ i: [TamGiac]) -> Void {
        tamGiac.forEach { (i) in // same with for...in
            let checkTG = i.isPytago()
            if checkTG.check {
                print(checkTG.printArray)
            }
        }
    }
}
var nTamGiac = [TamGiac(1, 2, 3), TamGiac(3, 4, 5), TamGiac(5, 6, 7)]
let checkTamGiac = TamGiacThoaPytago(nTamGiac)
checkTamGiac.checkPytago(nTamGiac)


// Baitap 7
class HocSinh {
    fileprivate var hoTen: String
    fileprivate var namSinh: Int
    fileprivate var tongDiem: Double

    init(hoTen: String, namSinh: Int, tongDiem: Double) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

class DanhSachHocSinh {
    private var danhSach: [HocSinh]

    init(_ danhSach: [HocSinh]) {
        self.danhSach = danhSach
    }

    func sapXep() -> [HocSinh] {
        for i in 0..<danhSach.count {
            for j in 1..<danhSach.count - i {
                if danhSach[j].tongDiem < danhSach[j-1].tongDiem {
                    let x = danhSach[j]
                    danhSach[j] = danhSach[j-1]
                    danhSach[j-1] = x
                } else if danhSach[j].tongDiem == danhSach[j-1].tongDiem {
                    for i in 1..<danhSach.count {
                        for j in 1..<danhSach.count - i {
                            if danhSach[j].namSinh < danhSach[j-1].namSinh {
                                let x = danhSach[j-1]
                                danhSach[j-1] = danhSach[j]
                                danhSach[j] = x
                            }
                        }
                    }
                }
            }
        }
        return danhSach
    }
}
var nHocSinh = [HocSinh(hoTen: "Nguyen Van A", namSinh: 1997, tongDiem: 10),
                HocSinh(hoTen: "Nguyen Van B", namSinh: 1996, tongDiem: 9),
                HocSinh(hoTen: "Nguyen Van C", namSinh: 1995, tongDiem: 9)]
var check = DanhSachHocSinh(nHocSinh)
check.sapXep()


// Baitap 8
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

        if month == 2 && year % 4 == 0 {
            self.day = 29
        } else if month == 2 && year % 4 != 0 {
            self.day = 28
        } else {
            return nil
        }

        if year < 1 {
            return nil
        } else {
            self.year = year
        }
    }

    func daysIn() -> Int? {
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

    func print() -> String {
        return "\(day)/\(month)/\(year)"
    }
}
var a = Date(30, 2, 1997)
a?.print()
a?.daysIn()
