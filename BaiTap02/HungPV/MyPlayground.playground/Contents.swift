import UIKit

// BAI 1
class PhanSo {
    private var tu:Int
    private var mau:Int
    
    init?(_ tu: Int, _ mau: Int) {
        self.tu = tu
        if mau == 0 {
            return nil
        }
        self.mau = mau
    }
    
    func cong(ps: PhanSo?) -> PhanSo? {
        guard let b = ps else { return nil }
        return PhanSo((self.tu * b.mau) + (b.tu * self.mau), (self.mau * b.mau))
    }
    func tru(ps: PhanSo?) -> PhanSo? {
        guard let b = ps else { return nil }
        return PhanSo((self.tu * b.mau) - (b.tu * self.mau), (self.mau * b.mau))
    }
    func nhan(ps: PhanSo?) -> PhanSo? {
        guard let b = ps else { return nil }
        return PhanSo(self.tu * b.tu, self.mau * b.mau)
    }
    func chia(ps: PhanSo?) -> PhanSo? {
        guard let b = ps else { return nil }
        return PhanSo(self.tu * b.mau, self.mau * b.tu)
    }
}


let ps1 = PhanSo(5, 2)
let ps2 = PhanSo(2, 2)

ps1?.cong(ps: ps2)
ps1?.tru(ps: ps2)
ps1?.nhan(ps: ps2)
ps1?.chia(ps: ps2)

// BAI 2

class DaGiac {
    private var socanh:Int
    private var mangx:[Int]
    
    init?(_ socanh : Int,_ mangx :[Int]) {
        var check = 1
        if socanh < 3 && mangx.count < 3 || socanh != mangx.count {
            return nil
        } else {
            self.socanh = socanh
            for item in mangx {
                check *= item
            }
            if check == 0 {
                return nil
            }
            self.mangx = mangx
        }
        
    }
    func chuvi() -> Int? {
        var sum = 0
        guard let daGiac = DaGiac(socanh, mangx) else { return nil }
        for temp in daGiac.mangx {
            sum += temp
        }
        return sum }
}
if let chuvi1 = DaGiac(4, [1,2,1,1]) {
    chuvi1.chuvi()
}

// BAI 3 : Xây dựng lớp TamGiac kế thừa từ lớp DaGiac, trong đó viết đè hàm tính chu vi và xây dựng thêm phương thức tính diện tích tam giác

class TamGiac : DaGiac {
    private var socanh:Int = 3
    private var mangx:[Int]
    
    override init?(_ socanh: Int = 3,_ mangx: [Int]) {
        self.mangx = mangx
        super.init(socanh, mangx)
    }
    override func chuvi() -> Int? {
        var sum = 0
        guard let tamGiac = TamGiac(socanh, mangx) else { return nil }
        for temp in tamGiac.mangx {
            sum += temp
        }
        return sum }
    
    func dienTich() -> Int? {
        var acreage = 0
        let p = chuvi()! / 2
        guard let dienTichS = TamGiac(socanh, mangx) else { return nil }
        acreage = Int(sqrt(Double(p * ( p - mangx[0] ) * ( p - mangx[1] ) * ( p - mangx[2]))))
        return acreage }
}
if let tamgiac1 = TamGiac(3, [3,3,2]) {
    tamgiac1.chuvi()
    tamgiac1.dienTich()
}

// BAI 4 : Xây dựng một ứng dụng để nhập vào một dãy gồm n tam giác rồi in ra màn hình các cạnh của các (tam giác thỏa mãn định lý Pitago.)

class TamGiac4 {
    var a:Double = 0.0
    var b:Double = 0.0
    var c:Double = 0.0
    
    init?(a: Double, b: Double, c: Double) {
        if a > 0 && b > 0 && c > 0 {
            self.a = a
            self.b = b
            self.c = c
        } else {
            return nil
        }
    }
    func checkPitago() -> Bool {
        if a == sqrt(pow(b,2) + pow(c,2)) || b == sqrt(pow(a, 2) + pow(c, 2)) || c == sqrt(pow(a, 2) + pow(b, 2)) {
            return true
        } else {
            return false
        }
    }
}
guard let tg = TamGiac4(a: 3, b: 4, c: 5) else { fatalError() }
if tg.checkPitago() {
    print(tg.a, tg.b, tg.c)
}

//// BAI 5

class CStack {
    private var stackArray:[Int] = [1,2,3]
    private var maxArray:Int = 5
    
    func isEmpty() -> Bool {
        if stackArray.isEmpty {
            return true
        } else {
            return false
        }
    }
    func isFull() -> Bool {
        if stackArray.count == 5 {
            return true
        } else {
            return false
        }
    }
    func push(_ element: Int) {
        return stackArray.append(element)
    }
    func pop() -> Int? {
        return stackArray.popLast()
    }
}

// BAI 6

class HinhVe {
    private var chieudai: Double
    private var chieurong: Double
    private var sopi = Double.pi
    
    init(_ chieudai: Double,_ chieurong: Double) {
        self.chieudai = chieudai
        self.chieurong = chieurong
    }
    
    func output() {
        print(" hinh ve ")
    }
    func chuVi() -> Double {
        return chieudai
    }
    func dienTich() -> Double {
        return chieurong
    }
    func theTich() -> Double {
        return sopi
    }
    class HaiChieu : HinhVe {
        override func output() {
            print(" hinh hai chieu ")
        }
        override func chuVi() -> Double {
            return chieudai + chieurong
        }
        override func dienTich() -> Double {
            return chieurong * chieurong
        }
        override func theTich() -> Double {
            return ( chieurong + chieudai ) * sopi
        }
    }
    class HinhTron : HaiChieu {
        private var r:Double
        
        init(_ dai: Double, _ rong: Double,_ bankinh :Double) {
            self.r = bankinh
            super.init(dai, rong)
        }
        override func chuVi() -> Double {
            return r * 2 * sopi
        }
        override func dienTich() -> Double {
            return r * r * sopi
        }
        
    }
    class HinhVuong : HaiChieu {
        override func chuVi() -> Double {
            return chieurong * 4
        }
        override func dienTich() -> Double {
            return chieurong * chieurong
        }
        override func output() {
            print("hinh vuong")
        }
    }
    class TamGiac : HaiChieu {
        private var d:Double
        
        init(_ d: Double,_ dai: Double,_ rong: Double) {
            self.d = d
            super.init(dai, rong)
        }
        override func chuVi() -> Double {
            return chieurong + chieudai + d
        }
        override func dienTich() -> Double {
            return sqrt((chuVi() / 2  * (chuVi() / 2 - chieudai) * (chuVi() / 2 * chieurong) * (chuVi() / 2 * d)))
        }
        override func output() {
            print("hinh tam giac")
        }
    }
    class BaChieu : HinhVe {
        override func output() {
            print("hinh ba chieu")
        }
        class Cau : BaChieu {
            private var r:Double
            init(_ chieudai: Double, _ chieurong: Double,_ bankinh: Double) {
                self.r = bankinh
                super.init(chieudai, chieurong)
            }
            override func dienTich() -> Double {
                return 4 * Double.pi * r * r
            }
            override func theTich() -> Double {
                return 4 / 3 * Double.pi * r * r * r
            }
            override func output() {
                print("hinh cau")
            }
        }
        class LapPhuong : BaChieu {
            private var a:Double
            
            init(_ dai: Double, _ rong: Double,_ canh:Double) {
                self.a = canh
                super.init(dai, rong)
            }
            override func dienTich() -> Double {
                return 6 * a * a
            }
            override func theTich() -> Double {
                return a * a * a
            }
            override func output() {
                print("hinh lap phuong")
            }
        }
    }
}

// Bai 7
class HocSinh {
    var hoTen: String
    var namSinh: Int
    var tongDiem: Int
    
    init(_ hoten: String, _ namSinh: Int, tongDiem: Int){
        self.hoTen = hoten
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
    func output() -> String {
        return "\(hoTen) \(namSinh) \(tongDiem)"
    }
}
class QLHocSinh {
    var hocSinh = [HocSinh]()
    
    init(_ hocSinh : [HocSinh]) {
        self.hocSinh = hocSinh
    }
    func sort() -> [HocSinh] {
        self.hocSinh.sort { (hs1, hs2) -> Bool in
            if hs1.tongDiem > hs2.tongDiem {
                return true
            } else if hs1.tongDiem == hs2.tongDiem {
                return hs1.namSinh < hs2.namSinh
            } else {
                return false
                
            }
        }
        for index in 0..<hocSinh.count {
            hocSinh[index].hoTen = hocSinh[index].hoTen.capitalized
            
        }
        return hocSinh }
}
var danhsach = QLHocSinh([HocSinh("le van luyen", 1999, tongDiem: 10), HocSinh("nguyen van b", 1994, tongDiem: 10), HocSinh("dao van tu", 1997, tongDiem: 6), HocSinh("ly thi le", 1998, tongDiem: 15)])
for temp in danhsach.sort() {
    print(temp.output())
}

// Bai8

class CustomDate {
    private var ngay:Int
    private var thang:Int
    private var nam:Int
    
    init(_ ngay: Int,_ thang: Int,_ nam: Int) {
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }
    func normalize() -> Bool {
        return ngay > 1 && ngay < 30 || thang > 1 && thang < 12 || nam >= 1
    }
    func daysIn(thang: Int) -> Int {
        if thang < 1 || thang > 12 {
            return 0
        } else {
            switch thang {
            case 1, 3, 5, 7, 8, 10, 12: return 31
            return 0
            case 4, 6, 9, 11: return 30
            return 0
            case 2:
                if nam % 100 == 0 || nam % 400 == 0 || nam % 4 == 0 {
                    return 29
                } else {
                    return 28
                }
            default:
                return 0
            }
        }
        return thang
    }
    func output() -> String {
        return ("\(ngay) \(thang) \(nam)")
    }
}
var date = CustomDate(2, 3, 2019)
print("hom nay la ngay: \(date.output())")
date.daysIn(thang: 8)

// Bai 9
class Mang1c {
    var mang1Chieu:[Int]
    init(mang1Chieu: [Int]) {
        self.mang1Chieu = mang1Chieu
    }
    func min() -> Int {
        let greatestmin = mang1Chieu.min()
        return greatestmin! }
    func max() -> Int {
        let greatestmax = mang1Chieu.max()
        return greatestmax! }
}
let m = Mang1c(mang1Chieu:[123,53,23,52,13,5,2,1,4,5234])
print(m.min())
print(m.max())
print("min is \(m.min()) and max is \(m.max())")

// Bai 10
class A {
    var n:Int
    init(n:Int) {
        self.n = n
    }
    func sum() -> Int {
        var sum = 0
        for i in 1...n {
            sum += i
        }
        return sum }
}
let abc = A(n: 12)
print("tong cua day A : \(abc.sum())")


var lowercased = "hello there"
var stringCapitalized = lowercased.capitalized
//prints:  "Hello There"
