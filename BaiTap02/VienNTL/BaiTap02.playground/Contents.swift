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
        switch mauSo {
        case 0:
            return "The fraction doesn't EXITS"
        case 1:
            return "\(tuSo)"
        default:
            return  "\(tuSo / ucln(tuSo, mauSo)) / \(mauSo / ucln(tuSo, mauSo))"
        }
    }

    func congPS(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo(tuSo * ps.mauSo + ps.tuSo * mauSo, mauSo * ps.mauSo)
            return result
        }
        return nil
    }

    func truSP(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo(tuSo * ps.mauSo - ps.tuSo * mauSo, mauSo * ps.mauSo)
            return result
        }
        return nil
    }

    func nhanPS(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo(tuSo * ps.tuSo, mauSo * ps.mauSo)
            return result
        }
        return nil
    }

    func chiaPS(_ ps: PhanSo?) -> PhanSo? {
        if let ps = ps {
            let result = PhanSo(tuSo * ps.mauSo, mauSo * ps.tuSo)
            return result
        }
        return nil
    }

    func ucln(_ num1: Int, _ num2: Int) -> Int {
        var a: Int = abs(num1)
        var b: Int = abs(num2)

        if a == 0 || b == 0 {
            return a+b
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

    private(set) var EdgeA = 0.0
    private(set) var EdgeB = 0.0
    private(set) var EdgeC = 0.0

    override func chuVi(_ quaEdge: Int, _ arrEdge: [Double]) -> Double {
        var cv: Double = 0
        for index in arrEdge {
                cv += index
        }
        return cv
    }

    func DienTich() -> Double {
        var dt: Double = 0
        let cv: Double = chuVi(3, arrayEdgeTriangle)
        for index in 0...1  {
            let tempDt: Double = cv * (cv - arrayEdgeTriangle[index]) * (cv - arrayEdgeTriangle[index + 1]) * (cv - arrayEdgeTriangle[index + 2])
            dt = sqrt(tempDt)
        }
        return dt
    }
}
// Bài 4 In n Tam Gíac
class NewTriangle {
    private(set) var a = 0.0
    private(set) var b = 0.0
    private(set) var c = 0.0

    init (_ a: Double, _ b: Double, _ c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }

    func checkPytago() -> (checkBool: Bool, arr: [Double]){
        if a  == sqrt(pow(b, 2) + pow(c, 2)) || b == sqrt(pow(a, 2) + pow(c, 2)) || c == sqrt(pow(a, 2) + pow(c, 2)) {
            return (true, [a, b, c])
        }
        return (false, [])
    }
}
class PrintNTRiangle {
    var arrayTriangle = [NewTriangle]()

    init(_ arrTriangle: [NewTriangle]) {
        arrayTriangle = arrTriangle
    }

    func output (_ tG: [NewTriangle]) -> Void {
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
    private(set) var s rray = [Int]()
    private(set) var max = 5

    func isEmpty() -> Bool {
        return  stackArray.isEmpty
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
    var quantity = 0
    func sum(_ quantity: Int) -> Int {
        var sum = 0
        for index in 0...quantity {
            sum += index
        }
        return sum
    }
}

