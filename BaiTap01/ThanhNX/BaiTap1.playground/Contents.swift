import UIKit

// Bai 1:
print("Bai 1: ")
func acreageAndVolumeGlobular(_ radius: Double) -> (Double, Double) {
    return (4 * Double.pi * pow(radius, 2), (4 / 3) * Double.pi * pow(radius, 3))
}

let display = acreageAndVolumeGlobular(15)
print("Acreage and Volume of Globular Radius = 15 is: \(display.0) and Volume is: \(display.1)")

print("Bai 2: ")
//Bai 2: ax2 + bx + c = 0

enum DapAn2 {
    case voNghiem, coMotNghiem (Float), co2Nghiem (Float, Float)
}

func ptBac2(_ a: Float, _ b: Float, _ c: Float) -> DapAn2 {
    let delta: Float = powf(b, 2) - 4 * a * c
    if a == 0 {
        if b == 0 {
            return .voNghiem
        } else {
            return .coMotNghiem(-c / b)
        }
    } else {
        if delta < 0 {
            return .voNghiem
        } else if delta == 0 {
            return .coMotNghiem(-b / (2 * a))
        } else {
            return .co2Nghiem(((-b + sqrtf(delta)) / (2 * a)) , ((-b - sqrtf(delta)) / (2 * a)))
        }
    }
}

print("Nghiệm phương trình bậc 2")
print(ptBac2(3, 8, 5))

print("Bai 3:")
//Bai 3: ax + by = c
//       dx + ey = f

enum DapAn3 {
    case voNghiem, voSoNghiem, co2Nghiem(Int, Int)
}

func hePT(_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> DapAn3 {
    if (a * e - d * b) == 0 {
        if c == f {
            return .voSoNghiem
        } else {
            return .voNghiem
        }
    } else {
        return .co2Nghiem(((c * e) - (f * b)) / ((a * e) - (d * b)), ((a * f) - (d * c)) / ((a * e) - (d * b)))
    }
}
print("He Phuong Trinh Co Nghiem")
print(hePT(2, 1, 4, 3, 2, 7))

print("Bai 4: ")
/*Tính các chuỗi số

    Tổng của 100 số Fibonacy đầu tiên
    Liệt kê 100 số Fibonacy đầu tiên
    Tính sin(x), cos(x) bằng công thức Chuỗi Taylor
    Liệt kê các số hạnh phúc bé hơn 10.000*/

var fibonaciList: [UInt64] = []
func fibonaci(n: UInt64) -> UInt64 {
    var a: UInt64 = 0, b: UInt64 = 1, sum: UInt64 = 0
    for i: UInt64 in 0..<n {
        if i <= 1 {
            sum = i
        } else {
            sum = a + b
            a = b
            b = sum
            fibonaciList.append(sum)
        }
    }
    return sum
}
fibonaci(n: 50)
print("50 so Fibonaci dau tien la \(fibonaciList)")
func sumFibonaci(sumFibonaci: UInt64) -> UInt64 {
    var sum: UInt64 = 0
    for _ in 1...sumFibonaci {
        sum += fibonaci(n: sumFibonaci)
    }
    return sum
}
print("Tong 50 so Fibonaci dau tien: \(sumFibonaci(sumFibonaci: 50))" )

func factorial(_ n: Double) -> Double {
    if n > 0 {
        return n * factorial(n - 1)
    } else {
        return 1
    }
}

func sinTaylor(_ x: Double, _ n: UInt) -> Double {
    var sinx = 0.0
    for temp in 0..<n {
        sinx += pow(-1, Double(temp)) * pow(x, Double(2 * temp + 1)) / factorial(Double(2 * temp + 1))
    }
    return sinx
}

print("Tinh sin x bang chuoi Taylor: \(sinTaylor(5, 10))")

func cosTaylor (_ x: Double,_ n: UInt) -> Double {
    return sqrt(1 - pow(sinTaylor(5, 10), 2))
}

print("Tinh cos x bang chuoi Taylor: \(cosTaylor(5, 10))")

func checkHappyNumber(_ number: Int) -> (Bool) {
    var num = number
    var length = 0
    var previous = 0
    var next = 0
    var preLength = 0
    var nextLength = 0
    while  num != 0 {
        length += 1
        num /= 10
    }
    if (length % 2) == 0 {
        previous = number / Int((pow(10, (Double(length) / 2))))
        next = number % Int((pow(10, (Double(length) / 2))))
        while previous != 0 {
            preLength += previous % 10
            previous /= 10
        }
        while next != 0 {
            nextLength += next % 10
            next /= 10
        }
        return preLength == nextLength
    } else {
        return false
    }
}

var arrHappyNumber: [Int] = []
for i in 1..<10000 {
    if checkHappyNumber(i) == true {
        arrHappyNumber.append(i)
    }
}
print("So hanh phuc nho hon 10000: \(arrHappyNumber)")

//Bai 5
print("Bai 5: ")
func findString(_ momStr: String, _ sonStr: String) -> UInt {
    return UInt(momStr.components(separatedBy: sonStr).count - 1)
}

print("So lan xuat hien cua chuoi con trong chuoi me: \(findString("abcdabcdabcdabcd", "abcd"))")

//Bai 6
print("Bai 6: ")
func randomArray(_ arr: [Int]) -> [Int] {
    return arr.shuffled()
}

print("Array after random: \(randomArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))")

//Bai 7
print("Bai 7: ")

func replaceArray(_ arr: [Int], elemToReplace: Int, substitutionElem: Int) -> Array<Int> {
    //Tao mang moi
    var newArrray: [Int] = []
    for i in 0..<arr.count {
        if arr[i] == elemToReplace {
            newArrray.append(substitutionElem)
        } else {
            newArrray.append(arr[i])
        }
    }
    return newArrray
}

print("Array After Replace: \(replaceArray([1,2,1], elemToReplace:  1, substitutionElem:  3))")
