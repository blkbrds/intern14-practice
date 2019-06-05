import UIKit

// Bai 1:
print("Bai 1: ")
func acreageAndVolumeGlobular(_ radius: Double) -> (Double, Double) {
    return (4 * Double.pi * pow(radius, 2), (4 / 3) * Double.pi * pow(radius, 3))
}

let display = acreageAndVolumeGlobular(15)
print("Acreage and Volume of Globular Radius = 15")
print("Acreage is: \(display.0) and Volume is: \(display.1)")

print("Bai 2: ")
//Bai 2: ax2 + bx + c = 0
enum dapAn2 {
    case VoNghiem
    case CoMotNghiem (Float)
    case Co2Nghiem (Float, Float)
}

func ptBac2(_ a: Float,_ b: Float, _ c: Float) -> dapAn2 {
    let delta: Float = powf(b, 2) - 4 * a * c
    if a == 0 {
        if b == 0 {
            return .VoNghiem
        }else{
            return .CoMotNghiem(-c / b)
        }
    }else{
        if delta < 0 {
            return .VoNghiem
        } else if delta == 0 {
            return .CoMotNghiem(-b / (2 * a))
        }else{
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
    case VoNghiem
    case VoSoNghiem
    case Co2Nghiem(Int, Int)
}

func hePT (_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> dapan3 {
    let m = (a * e) - (d * b)
    let n = (c * e) - (f * b)
    let q = (a * f) - (d * c)
    
    if m == 0 {
        if c == f {
            return .VoSoNghiem
        }else{
            return .VoNghiem
        }
    }else{
        return .Co2Nghiem(n / m, q / m)
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
func Fibonaci (n: UInt64) -> (UInt64){
    var a: UInt64 = 0
    var b: UInt64 = 1
    var sum: UInt64 = 0
    for i: UInt64 in 0...n{
        if i <= 1 {
            sum = i
        }else {
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

func sumFibonaci(E: UInt64) -> (UInt64){
    var sum: UInt64 = 0
    for i: UInt64 in 1...E{
        sum += Fibonaci(n: E)
    }
    return sum
}
print("Tong 50 so Fibonaci dau tien: \(sumFibonaci(E: 50))" )
