import UIKit

print("BÀI TẬP 2: OOP SWIFT")
// Bài 1
class PhanSo {
    private(set) var tuSo: Int
    private(set) var mauSo: Int
    
    init?(_ tuSo: Int, _ mauSo: Int) {
        self.tuSo = tuSo
        if mauSo == 0 {
            return nil
        }
        self.mauSo = mauSo
    }
    
    func inPS() -> String {
        return  "\(tuSo) / \(mauSo)"
    }
    
    func congPS(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo((tuSo * ps.mauSo + ps.tuSo * mauSo) / ucln(tuSo, mauSo), (mauSo * ps.mauSo) / ucln(tuSo, mauSo) )
            return result
        }
        return nil
    }
    
    func truSP(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo((tuSo * ps.mauSo - ps.tuSo * mauSo) / ucln(tuSo, mauSo), (mauSo * ps.mauSo) / ucln(tuSo, mauSo))
            return result
        }
        return nil
    }
    
    func nhanPS(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo(tuSo * ps.tuSo / ucln(tuSo, mauSo), mauSo * ps.mauSo / ucln(tuSo, mauSo))
            return result
        }
        return nil
    }
    
    func chiaPS(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo(tuSo * ps.mauSo / ucln(tuSo, mauSo), mauSo * ps.tuSo / ucln(tuSo, mauSo))
            return result
        }
        return nil
    }
    
    func ucln(_ num1: Int, _ num2: Int) -> Int {
        var a = abs(num1)
        var b = abs(num2)
        
        if a == 0 || b == 0 {
            return a + b
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
}
var pSo = PhanSo(2,2)
var pSo2 = PhanSo(2,2)
print("\nQuestion 1: ")
if let phanSo = pSo, let phanSo2 = pSo2 {
    if let congPS = phanSo.congPS(phanSo2) {
        print("\n .Addition: \(phanSo.inPS()) + \(phanSo2.inPS()) = \(congPS.inPS())")
    }
}
if let phanSo = pSo, let phanSo2 = pSo2 {
    if let truPS = phanSo.truSP(phanSo2) {
        print("\n .Subtraction: \(phanSo.inPS()) - \(phanSo2.inPS()) = \(truPS.inPS())")
    }
}
if let phanSo = pSo, let phanSo2 = pSo2 {
    if let nhanPS = phanSo.nhanPS(phanSo2) {
        print("\n .Multiplication: \(phanSo.inPS()) * \(phanSo2.inPS()) = \(nhanPS.inPS())")
    }
}
if let phanSo = pSo, let phanSo2 = pSo2 {
    if let chiaPS = phanSo.chiaPS(phanSo2) {
        print("\n .Division: \(phanSo.inPS()) / \(phanSo2.inPS()) = \(chiaPS.inPS())")
    }
}
// Bài 2
class DaGiac {
    private(set) var arrayEdge = [Double]()
    private(set) var quantityEdge: Int = 0
    
    init(_ quantityEdge: Int, _ arrEdge: [Double]) {
        if quantityEdge < 3 {
            print("\n This isn't polygon")
        } else {
            self.quantityEdge = quantityEdge
        }
        self.arrayEdge = arrEdge
    }
    
    func chuVi(_ quanEdge: Int, _ arrEdge: [Double]) -> Double {
        var cv: Double = 0
        for index in arrEdge {
            if quanEdge < 3 {
                return cv
            } else {
                cv += index
            }
        }
        return cv
    }
    
    func output() {
        print("\nThe values of the sides of the polygon is: ")
        for index in arrayEdge {
            print(" \(index)")
        }
    }
}
var arr: [Double] = [1, 4, 3]
var dg = DaGiac(3, arr)
// In các giá trị của mảng
dg.output()
print("The polygon circumference is: \(dg.chuVi(3, arr))")
// Bài 3:
class TamGiac: DaGiac {
    private(set) var arrayEdgeTriangle = [Double]()
    private(set) var quantityEdgeTriangle = 0
    
    override func chuVi(_ quaEdge: Int, _ arrEdge: [Double]) -> Double {
        var cv: Double = 0
        for index in arrEdge {
            cv += index
        }
        return cv
    }
    
    func dienTich() -> Double {
        var dienTich: Double = 0
        let ChuVi: Double = chuVi(3, arrayEdgeTriangle)
        for index in 0...1  {
            let tempDienTich: Double = ChuVi * (ChuVi - arrayEdgeTriangle[index]) * (ChuVi - arrayEdgeTriangle[index + 1]) * (ChuVi - arrayEdgeTriangle[index + 2])
            dienTich = sqrt(tempDienTich)
        }
        return dienTich
    }
}
// Bài 4 In n Tam Gíac
class NewTriangle {
    private(set) var a: Double?
    private(set) var b: Double?
    private(set) var c: Double?
    
    init(_ a: Double?, _ b: Double?, _ c: Double?) {
        if let triangleEdgeA = a {
            self.a = triangleEdgeA
        }
        if let triangleEdgeB = b {
            self.b = triangleEdgeB
        }
        if let triangleEdgeC = c {
            self.c = triangleEdgeC
        }
    }
    
    func unWrapped(_ x: Double?) -> Double {
        if let unWrappedX = x {
            return unWrappedX
        }
    }
    
    func checkPytago() -> (checkBool: Bool, arr: [Double]) {
        if a  == sqrt(pow(unWrapped(b), 2) + pow(unWrapped(c), 2)) || b == sqrt(pow(unWrapped(a), 2) + pow(unWrapped(c), 2)) || c == sqrt(pow(unWrapped(a), 2) + pow(unWrapped(c), 2)) {
            return (true, [unWrapped(a), unWrapped(b), unWrapped(c)])
        }
        return (false, [])
    }
}
class PrintNTRiangle {
    var arrayTriangle = [NewTriangle]()
    
    init(_ arrTriangle: [NewTriangle]) {
        arrayTriangle = arrTriangle
    }
    
    func output(_ tG: [NewTriangle]) -> Void {
        arrayTriangle.forEach{ (tG) in
            let check = tG.checkPytago()
            if check.checkBool {
                print(check.arr)
            }
        }
    }
}
// Bài 5:
class CStack {
    private(set) var stackArray = [Int]()
    private(set) var max = 5
    
    func isEmpty() -> Bool{
        if stackArray.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func isFull() -> Bool {
        return stackArray.count == max
    }
    
    func push(_ element: Int) {
        if !isFull() {
            stackArray.append(element)
        } else {
            print("Stack Full")
        }
    }
    
    func pop() -> Int? {
        return stackArray.popLast()
    }
}
// Bài 6:
class HinhVe {
    private(set) var chieuDai: Double = 0.0
    private(set) var chieuRong: Double = 0.0
    private(set) let  pi: Double = Double.pi
    
    init(_ dai: Double, _ rong: Double) {
        chieuDai = dai
        chieuRong = rong
    }
    func ouput() {
        print(" ")
    }
    func chuVi() -> Double {
        return chieuDai
    }
    func dienTich() -> Double {
        return chieuRong
    }
    func theTich() -> Double {
        return 0.0
    }
}
class HaiChieu: HinhVe {
    override func chuVi() -> Double {
        return chieuRong + chieuRong
    }
    override func dienTich() -> Double {
        return chieuRong * chieuDai
    }
    override func ouput() {
        print("Hinh Hai Chieu")
    }
}
class Vuong: HaiChieu {
    override func chuVi() -> Double {
        return chieuDai * 4
    }
    override func dienTich() -> Double {
        return chieuDai * chieuRong
    }
}
class Tron: HaiChieu {
    private(set) var r: Double
    
    init(_ dai: Double, _ rong: Double, _ banKinh: Double) {
        self.r = banKinh
        super.init(dai, rong)
    }
    override func chuVi() -> Double {
        return 2 * pi * r
    }
    override func dienTich() -> Double {
        return pi * pow(r, 2)
    }
}
class TamGiac2: HaiChieu {
    private(set) var c: Double
    
    init(_ a: Double, _ b: Double, _ c: Double ) {
        self.c = c
        super.init(a, b)
    }
    override func chuVi() -> Double {
        return (chieuDai + chieuRong + c)
    }
    override func dienTich() -> Double {
        return sqrt((chuVi() / 2) * ((chuVi() / 2) - chieuDai) * ((chuVi() / 2) - chieuRong) * ((chuVi() / 2) - c))
    }
}
class BaChieu: HinhVe {
    override func ouput() {
        print("Hinh Ba Chieu")
    }
}
class Cau: BaChieu {
    private(set) var r: Double
    
    init(_ dai: Double, _ rong: Double, _ banKinh: Double) {
        self.r = banKinh
        super.init(dai, rong)
    }
    override func dienTich() -> Double {
        return 4 * pi * pow(r, 2)
    }
    override func theTich() -> Double {
        return 4 / 3 * pi * pow(r, 3)
    }
}
class LapPhuong: BaChieu {
    override func theTich() -> Double {
        return chieuDai * chieuDai * chieuDai
    }
    override func dienTich() -> Double {
        return 6 * pow(chieuDai, 2)
    }
    func dienTichXungQuanh() -> Double {
        return 4 * pow(chieuDai, 2)
    }
}
// Bài 7:
class HocSinh {
    private(set) var hoTen = String()
    private(set) var namSinh = String()
    private(set) var tongDiem = 0.0
    
    init(_ hoten: String, _ namSinh: String, tongDiem: Double) {
        self.hoTen = hoten
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}
class QuanLiHocSinh {
    private(set) var hocSinh = [HocSinh]()
    
    init(_ sinhVien: [HocSinh]) {
        self.hocSinh = sinhVien
    }
    func sort() -> [HocSinh] {
        var tempArr = hocSinh
        for index in 0..<tempArr.count {
            if tempArr[index].tongDiem == tempArr[index + 1].tongDiem {
                if tempArr[index].namSinh > tempArr[index + 1].namSinh  {
                    let temp = tempArr[index]
                    tempArr[index] = tempArr[index + 1]
                    tempArr[index + 1] = temp
                }
            } else {
                if tempArr[index].tongDiem < tempArr[index + 1].tongDiem {
                    let temp = tempArr[index]
                    tempArr[index] = tempArr[index + 1]
                    tempArr[index + 1] = temp
                }
            }
        }
        return tempArr
    }
    func getChar(_ string: String, atIndex i: Int) -> String {
        if i < string.count {
            return String(string[string.index(string.startIndex, offsetBy: i)])
        }
        return ""
    }
    func inHoaHoTen() -> [HocSinh] {
        var tempArr = hocSinh
        for index in 0..<tempArr.count {
            for index2 in 0..<tempArr[index].hoTen.count {
                let temp = tempArr[index].hoTen
                if (getChar(temp, atIndex: index2 - 1) == " ") {
                    getChar(temp, atIndex: index2).uppercased()
                }
            }
        }
        return tempArr
    }
}
// Bài 8:
class Date {
    private(set) var day: Int
    private(set) var month: Int
    private(set) var year: Int
    
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
                if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                    return 29
                } else {
                    return 28
                }
            default:
                return 0
            }
        }
    }
}
// Bài 9:
class ArrayDimensional {
    private(set) var array = [Int]()
    init(_ array: [Int]) {
        self.array = array
    }
    
    func findMax(_ arr: [Int]) -> Int {
        var max = 0
        for i in 0..<arr.count {
            if arr[i] < arr[i + 1] {
                max = arr[i + 1]
            }
        }
        return max
    }
    func findMin(_ arr: [Int]) -> Int {
        var min = 0
        for i in 0..<arr.count {
            if arr[i] > arr[i + 1] {
                min = arr[i + 1]
            }
        }
        return min
    }
    
}
// Bài 10
class IntNumberSum {
    var quantity: Int = 0
    init(_ quantity: Int) {
        self.quantity = quantity
    }
    func sum() -> Int {
        var sum = 0
        for index in 1...quantity {
            sum += index
        }
        return sum
    }
}
