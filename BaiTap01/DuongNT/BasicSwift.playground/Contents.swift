import UIKit

// Bài tập 1:
// use "-" instead of args label in func
func calculateGlobular(_ r: Double) -> (dienTich: Double, theTich: Double) {
    return (4 * Double.pi * pow(r, 2), (4 * Double.pi * pow(r, 3)) / 3)
}
let hinhCau = calculateGlobular(4)
print("""
    Diện tích và thể tích hình cầu có bán kính là 4!
    Diện tích: \(hinhCau.dienTich)
    Thể tích: \(hinhCau.theTich)
    """)

// Bài tập 2:
enum PhuongTrinh {
    case phuongTrinhBacMot(Double)
    case phuongTrinhBacHai(Double, Double)
}
func phuongTrinhBacHai(_ a: Double, _ b: Double, _ c: Double) -> PhuongTrinh? {
    var nghiem1: Double?
    var nghiem2: Double?
    
    if a == 0 && b != 0 {
        return .phuongTrinhBacMot(-c / b)
    } else {
        let delta = pow(b, 2) - 4 * a * c
        if delta > 0 {
            nghiem1 = (-b - sqrt(delta)) / (2 * a)
            nghiem2 = (-b + sqrt(delta)) / (2 * a)
        } else if delta == 0 {
            let nghiem: Double = -b / (2 * a)
            nghiem1 = nghiem
            nghiem2 = nghiem
        }
        
        // check vô nghiệm
        guard let nghiem1 = nghiem1, let nghiem2 = nghiem2 else { return nil }
        return .phuongTrinhBacHai(nghiem1, nghiem2)
    }
}

// unwrap optional
if let phuongTrinh = phuongTrinhBacHai(1, 0, 1) {
    print(phuongTrinh)
} else {
    print("Vô nghiệm!!!")
}

// Bài tập 3
// Return d, dx, dy to check result
func hePhuongTrinh(_ a1: Double, _ b1: Double, _ c1: Double, _ a2: Double, _ b2: Double, _ c2: Double ) -> (d: Double, dx: Double, dy: Double) {
    return (a1 * b2 - a2 * b1, c1 * b2 - c2 * b1, a1 * c2 - a2 * c1)
}
let hePT = hePhuongTrinh(5, 6, 8, 5, 6, 8)

if hePT.d != 0 {
    print("Phương trình có cặp nghiệm là (\(hePT.dx/hePT.d),\(hePT.dy/hePT.d))")
} else if hePT.dx != 0 {
    print("Hệ vô nghiệm")
} else {
    print("Hệ vô số nghiệm")
}

// Bài tập 4
// The value of fibonacy in this index
func valueFibonacy(_ index: Int) -> Int {
    var a = 0
    var a1 = 1
    var a2 = 1
    var i = 3
    if index == 0 {
        return 0
    } else if index == 1 || index == 2  {
        return 1
    } else {
        while i <= index {
            a = a1 + a2
            a1 = a2
            a2 = a
            i += 1
        }
        return a
    }
}

var sum = 0
var listFibonacy = [Int]()
for index in 0..<50 {
    sum += valueFibonacy(index)
    listFibonacy.append(valueFibonacy(index))
}
print("1/ Tổng của 50 số Fibonacy đầu tiên: \(sum)")
print("2/ Liệt kê 50 số Fibonacy đầu tiên: \(listFibonacy)")

func giaiThua(_ n: Double) -> Double {
    if n > 1 {
        return n * giaiThua(n - 1)
    } else {
        return 1.0
    }
}

func sinx(_ x: Double,_ n: Int) -> Double {
    var sinx = 0.0
    for temp in 0..<n {
        sinx += pow(-1, Double(temp)) * pow(x, Double(2 * temp + 1)) / giaiThua(Double(2 * temp + 1))
    }
    return sinx
}
func cosx(_ x: Double,_ n: Int) -> Double {
    return sqrt(1 - pow(sinx(x, n), 2))
}
print("""
    3/ Sinx, Cosx bằng công thức Chuỗi Taylor:
    Sin(0.875) = \(sinx(0.875, 10))
    Cos(0.875) = \(cosx(0.875, 10))
    """)

// Check happy number
func checkHappyNumber(_ number: Int) -> Bool {
    
    // Check length of number
    var num = number
    var length = 0
    var x1 = 0
    var x2 = 0
    var sum1 = 0
    var sum2 = 0
    while num != 0 {
        length += 1
        num /= 10
    }
    if (length % 2) == 0 {
        x1 = number / Int((pow(10, (Double(length) / 2))))
        x2 = number % Int((pow(10, (Double(length) / 2))))
        while x1 != 0 {
            sum1 += x1 % 10
            x1 /= 10
        }
        while x2 != 0 {
            sum2 += x2 % 10
            x2 /= 10
        }
        return sum1 == sum2
    } else {
        return false
    }
}
func checkNguyenTo(_ number: Int) -> Bool {
    var index = 0
    var count = 0
    if (number % 2) == 0 {
        index = Int(number / 2)
    } else if number > 1 {
        index = Int(Double(number - 1) / 2)
    } else {
        index = number
    }
    for item in 1...Int(index) {
        if (number % item) == 0 {
            count += 1
        }
    }
    if count > 1 {
        return false
    }
    return true
}
var listHappyNumber = [Int]()
for index in 1..<10000 {
    if checkHappyNumber(index) && checkNguyenTo(index) {
        listHappyNumber.append(index)
    }
}
print("4/ List happy number less 10000: \(listHappyNumber)")

// Bài 5
func checkExistCount(_ parent: String, _ child: String) -> Int {
    // components use cut string a given separator.
    return parent.components(separatedBy: child).count - 1
}
checkExistCount("abaaaabbbabababbaaabababa", "ab")

//  Bài 6
func permutateArray(_ array: Array<Int>) -> Array<Int> {
    return array.shuffled()
}
permutateArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

// Bài 7
func bearrayReplace(_ inputArray: Array<Int>,_ elemToReplace: Int,_ substitutionElem: Int) -> Array<Int> {
    var newArrray = [Int]()
    for index in 0..<inputArray.count {
        if inputArray[index] == elemToReplace {
            newArrray.append(substitutionElem)
        } else {
            newArrray.append(inputArray[index])
        }
    }
    return newArrray
}

let inputArray = [1, 2, 1]
bearrayReplace(inputArray, 2, 3)
