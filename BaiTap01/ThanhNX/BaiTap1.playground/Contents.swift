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
enum dapAn2 {
    case VoNghiem, CoMotNghiem (Float), Co2Nghiem (Float, Float)
//    var name: String {
//        switch self {
//        case .VoNghiem:
//            return "Phuong trinh vo nghiem"
//        case .CoMotNghiem:
//            return "Phuong trinh co mot nghiem: "
//        case .Co2Nghiem:
//            return "Phuong trinh co hai nghiem: "
//        default:
//            return "=============="
//        }
//    }
}

func ptBac2(_ a: Float,_ b: Float, _ c: Float) -> dapAn2 {
    let delta: Float = powf(b, 2) - 4 * a * c
    if a == 0 {
        if b == 0 {
            return .VoNghiem
        } else {
            return .CoMotNghiem (-c / b)
        }
    } else {
        if delta < 0 {
            return .VoNghiem
        } else if delta == 0 {
            return .CoMotNghiem (-b / (2 * a))
        } else {
            return .Co2Nghiem (((-b + sqrtf(delta)) / (2 * a)) , ((-b - sqrtf(delta)) / (2 * a)))
        }
    }
}

print("Nghiệm phương trình bậc 2")
print(ptBac2(3, 8, 5))

print("Bai 3:")
//Bai 3: ax + by = c
//       dx + ey = f

enum dapan3 {
    case VoNghiem, VoSoNghiem, Co2Nghiem(Int, Int)
}

func hePT (_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> dapan3 {

    if (a * e) - (d * b) == 0 {
        if c == f {
            return .VoSoNghiem
        } else {
            return .VoNghiem
        }
    } else {
        return .Co2Nghiem(((c * e) - (f * b)) / ((a * e) - (d * b)), ((a * f) - (d * c)) / ((a * e) - (d * b)))
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
func Fibonaci(n: UInt64) -> UInt64 {
    var a: UInt64 = 0, b: UInt64 = 1, sum: UInt64 = 0
    for i: UInt64 in 0...n {
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
Fibonaci(n: 50)
print("50 so Fibonaci dau tien la \(fibonaciList)")

func sumFibonaci(E: UInt64) -> UInt64 {
    var sum: UInt64 = 0
    for _ in 1...E {
        sum += Fibonaci(n: E)
    }
    return sum
}
print("Tong 50 so Fibonaci dau tien: \(sumFibonaci(E: 50))" )

func factorial(_ n: Double) -> Double {
    if n > 0 {
        return n * factorial(n - 1)
    } else {
        return 1
    }
}

func sinTaylor (_ x: Double,_ n: UInt) -> Double {
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

//Bai 5
print("Bai 5: ")

func chuoiString(_ mom: String,_ son: String) -> UInt {
    return UInt(mom.components(separatedBy: son).count - 1)
}

print("So lan xuat hien cua chuoi con trong chuoi me: \(chuoiString("abcdabcdabcdabcd", "abcd"))")

//Bai 6
print("Bai 6: ")
func arrayRandom(_ arr: Array<Int>) -> Array<Int> {
    return arr.shuffled()
}

print("Array after random: \(arrayRandom([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))")

//Bai 7
print("Bai 7: ")

func arrayReplace(_ arr: Array<Int>,elemToReplace: Int,substitutionElem: Int) -> Array<Int> {
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

print("Array After Replace: \(arrayReplace([1,2,1], elemToReplace:  1, substitutionElem:  3))")
