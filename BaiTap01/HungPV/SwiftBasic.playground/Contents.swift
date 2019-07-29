import UIKit
//Tính diện tích và thể tích hình cầu.
//Viết 1 function với tham số là bán kính hình cầu
//Giá trị trả về bao gồm 2 giá trị (diện tích và thể tích)

func tinhHC(banKinhR: Int = 2) -> (dienTich: Double, theTich: Double) {
    let pi = Double.pi
    let dienTich = Double(banKinhR * banKinhR * 4) * pi
    let theTich = Double(banKinhR * banKinhR * banKinhR * (4/3) ) * pi
    return (dienTich, theTich)
}

//Tính phương trình bậc 2 : ax^2 + bx + c = 0
//Kiểm tra điều kiện
//Trả về nhiều giá trị 1 lần
enum NghiemPT {
    case voNghiem
    case motNghiem(x1: Double)
    case haiNghiem(x1: Double, x2: Double)
}
func tinhPT(a: Double, b: Double, c: Double) -> NghiemPT {
    let delta = b*b - 4*a*c
    if a == 0 {
        let x1 = -c / b
        return .motNghiem(x1: x1)
    } else {
        if delta < 0 && a != 0 {
            return .voNghiem
        } else if delta == 0 && a != 0 {
            let x1 = -b / 2 / a
            return .motNghiem(x1: x1)
        } else {
            let x1 = (-b - sqrt(delta)) / 2 / a
            let x2 = (-b + sqrt(delta)) / 2 / a
            return .haiNghiem(x1: x1, x2: x2)
        }
        
    }
}
switch tinhPT(a: 1, b: 3, c: 2) {
case .voNghiem:
    print("pt vo nghiem")
    break
case .motNghiem(let x1):
    print("pt co 1 nghiem x1 =  \(x1)")
    break
case .haiNghiem(let x1, let x2):
    print("pt co 2 nghiem x1 = \(x1) , x2 = \(x2) ")
    break
default:
    print("pt vo nghiem")
}
//Giải hệ phương trình bậc nhất 2 ẩn số
enum NghiemPT2 {
    case vonghiem
    case co2nghiem(Double,Double)
    case vosonghiem
}

func giaiHePT(a1: Double, a2: Double, b1: Double, b2: Double, c1: Double, c2: Double) -> NghiemPT2 {
    var D:Double = a1 * b2 - a2 * b1
    var Dx:Double = c1 * b2 - c2 * b1
    var Dy:Double = a1 * c2 - a2 * c1
    let x:Double = Dx / D
    let y:Double = Dy / D
    if D == 0 && c1 == 0 && c2 == 0 {
        print("pt co vo so nghiem")
        return .vosonghiem
    } else if D == 0 && c1 != c2 {
        print("pt vo nghiem")
        return .vonghiem
    } else {
        print("pt co 2 nghiem x va y")
        return .co2nghiem(x, y)
    }
}
switch giaiHePT(a1: 2, a2: 3, b1: 1, b2: 2, c1: 4, c2: 7) {
case .vonghiem:
    print("pt vo nghiem")
    break
case .co2nghiem(let x, let y):
    print("nghiem cua phuong trinh la x = \(x) va y = \(y)")
    break
case .vosonghiem:
    print("pt co vo so nghiem")
    break
default:
    print("pt vo nghiem")
}

//Tổng của 100 số Fibonacy đầu tiên
//Liệt kê 100 số Fibonacy đầu tiên

func getFibonacy(n:Int = 100) -> [Double] {
    var array: [Double] = [1, 1]
    var fib1 = 1.0
    var fib2 = 1.0
    var fib = 0.0
    while array.count < n {
        fib = fib1 + fib2
        array.append(fib)
        fib2 = fib1
        fib1 = fib
    }
    print(array.reduce(0, +))
    return array
}
let fibonacies = getFibonacy()

//Tính sin(x), cos(x) bằng công thức Chuỗi Taylor
//Liệt kê các số hạnh phúc bé hơn 10.000
func tinhSin(_ x:Double) -> Double {
    var S:Double = 0.0
    let epsilon = 0.000001
    let tempx = ( x * Double.pi ) / 180
    var a:Double = tempx
    var i:Double = 3.0
    while fabs(a) >= epsilon {
        S = S + a
        a = a * (-(tempx * tempx / ( i * ( i - 1))))
        i += 2
    }
    return S
}
print ("gia tri cua Sin la : \(tinhSin(90))")

func tinhCos (_ x:Double) -> Double {
    let epsilon = 0.000001
    let tempx = ( x * Double.pi ) / 180
    var C:Double = 0.0
    var a:Double = tempx
    var i:Double = 3.0
    while fabs(a) >= epsilon {
        C += a
        a = a * (-(tempx * tempx / ( i * ( i - 1))))
        i += 2
    }
    return C
}
print ("gia tri cua Cos la : \(tinhCos(90))")

//The number of occurrences of the substring in the parent string
//Đầu vào (ví dụ)
//1 chuỗi kí tự với 2 loại kí tự (abaaaabbbabababbaaabababa....)
//1 chuỗi con tương tự chuỗi mẹ (ví dụ: ab)
//Kết quả:
//Số lần xuất hiện của chuỗi con trong chuỗi mẹ

func soLan(chuoiMe: String,chuoiCon: String) -> Int {
    let solanXH = chuoiMe.components(separatedBy: chuoiCon).count-1
    return solanXH
}
print(soLan(chuoiMe: "abcdabdcab123", chuoiCon: "ab"))

//Hoán vị random các phần tử trong mãng
//Ví dụ: cho 1 mãng số Int từ 0 đến 9 (theo thứ tự lớn dần). In ra mãng đó với thứ tự các phần tử được hoán vị ngẫu nhiên. Mỗi lần in mỗi khác nhau.

func hoanVi(mang1:[Int]) -> [Int] {
    let ngauNhien:[Int] = mang1.shuffled()
    return ngauNhien
}
print (hoanVi(mang1: [0,1,2,3,4,5,6,7,8,9]))

//Given an array of integers, replace all the occurrences of elemToReplace with substitutionElem.
func btReplace(inputArray: [Int],elem: Int,subs: Int) -> [Int] {
    var newArrray = [Int]()
    for i in 0..<inputArray.count {
        if inputArray[i] == elem {
            newArrray.append(subs)
        } else {
            newArrray.append(inputArray[i])
        }
    }
    return newArrray }
print(btReplace(inputArray: [1,2,1,4,1,5,1], elem: 1, subs: 3))

