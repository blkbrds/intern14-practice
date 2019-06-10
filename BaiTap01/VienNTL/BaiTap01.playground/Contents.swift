import UIKit

print("Exercise 01 : Swift Basic")
// Bai 1 Tính diên tích và thể tích hình cầu
func globular(radius: Double) -> (acreage: Double, volume: Double) {
    return(4 / 3 * Double.pi * pow(radius, 3), 4 * Double.pi * pow(radius, 2))
}
var result1 = globular(radius: 4)
print("\nQuestion 1:\n\n The glubular has the acreage is \(result1.acreage). \n The globular has the volume is \(result1.volume). ")

// Bai 2 giải phương trình bậc 2
enum HandleSolution2 {
    case oneSolution(Float)
    case twoSolution(Float, Float)
    case noSolution2
}
func quardaticEquation2(_ a: Float, _ b: Float, _ c: Float) -> HandleSolution2 {
    let del = pow(b, 2) - (4 * a * c)
    if a == 0 {
        if b == 0 {
            return .noSolution2
        } else {
            return .oneSolution(c / b)
        }
    } else {
        if del == 0 {
            return .oneSolution(-b / 2 / a)
        } else if del > 0 {
            return .twoSolution( (-b - sqrt(del)) / 2 / a, (-b + sqrt(del)) / 2 / a)
        } else {
            return .noSolution2
        }
    }
}
print("\nQuestion2:\n\n The result of equation:\n  \(quardaticEquation2(3,8,5))")

// Bai3 Giải hệ phương trình bậc nhất 2 ẩn
enum HandleSolution3 {
    case noSolution3
    case countlessSolution
    case twoSolution3(Float, Float)
}
func firstClassEquation(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> HandleSolution3 {
    var d, d1, d2 : Float
    d = a1 * b2 - a2 * b1
    d1 = c1 * b2 - c2 * b1
    d2 = a1 * c2 - a2 * c1
    if d == 0 {
        if c1 == c2 {
             return .countlessSolution
        } else {
            return .noSolution3
        }
    }else {
            return .twoSolution3(d1 / d, d2 / d)
        }
    }
print("\nQuestion 3:\n\n  Equations have solutions \(firstClassEquation(a1: 1, b1: 2, c1: 3, a2: 5, b2: 3, c2: 1))")

// Bai4 Fibonacy
var arrFibonacy = [UInt64]()
func fibonacy(_ n: UInt64) -> UInt64 {
    var a: UInt64 = 0
    var b: UInt64 = 1
    var next: UInt64 = 0
    for i: UInt64 in 0..<n {
        if i <= 1 {
            next = i
        } else {
            next = a + b
            a = b
            b = next
            arrFibonacy.append(next)
        }
    }
    return (next)
}
fibonacy(50)
print ("\nQuestion 4:\n\n The first 50 fibonaci numbers: \(arrFibonacy)")

// Tổng số
func sumFirst50Fibonacy(_ inputNumber: UInt64) -> UInt64 {
    var sum: UInt64 = 0
    for index: UInt64 in 1...inputNumber {
        sum += fibonacy(index)
    }
    return sum
}
print ("\n The sum of 50 first Fibonaci numbers : \(sumFirst50Fibonacy(50))")

// Chuỗi Taylor
// tính giai thừa
func factorial(_ n: Double) -> Double {
    if n > 1 {
        return n * factorial (n - 1)
    } else {
        return 1.0
    }
}

func sinTaylorSeries (_ x: Double, _ n: Int) -> Double {
    var sinx = 0.0
    for index in 0..<n {
        sinx += pow(-1, Double(index)) * pow(x, Double(2 * index + 1)) / factorial(Double(2 * index + 1))
    }
    return sinx
}
print("\n Calculate sin(x) with the Taylor String formula \(sinTaylorSeries(0.5,2))")

func cosTaylorSeries (_ x: Double,_ n: Int) -> Double {
    return sqrt(1 - pow(sinTaylorSeries(x, n), 2))
}
print("\n Calculate cos(x) with the Taylor String formula \(cosTaylorSeries(0.5,2))")

// Sô hạnh phúc
func checkHappyNumber(_ number: Int) -> Bool {
    var num = number
    var length = 0
    var previous = 0
    var next = 0
    var preLength = 0
    var nextLength = 0
    while num != 0 {
        length += 1
        num /= 10
    }
    if length % 2 == 0 {
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

var arrHappyNumber = [Int]()
for index in 1..<10000 {
    if checkHappyNumber(index) == true {
        arrHappyNumber.append(index)
    }
}
print("\nList happy number less 10000:  \(arrHappyNumber)")

// Bài 5
func checkSubString(_ subString: String, _ mainString: String) -> Int {
    var count: Int = 0

    for index in 0...mainString.count - subString.count {
        //NSRange(vị trí bắt đầu, vị trí kết thúc)
        let myRange = NSRange(location: index, length: subString.count)
        let myNSString = NSString(string: mainString)
        if subString == myNSString.substring(with: myRange) {
            count += 1
        }
    }
    return count
}


print("\nQuestion 5:\n\n The number of times a SUBSTRING exists in the MAIN STRING is: \(checkSubString("ab","abaaaabbbabababbaaabababa..."))")

// Bài 6
func sortRandomArray(_ array: [Int] ) -> [Int] {
    return array.shuffled()
}
let array = [1,3,5,7,9,11,12,0]
print("\nQuestion 6:\n\n The array after sorted: \(sortRandomArray(array))")

// Bài 7 Replace Element
func bearrayReplace(_ inpuArray: [Int], _ elemToReplace: Int, _ substitutionElem: Int) -> [Int] {
    var tempArrray = [Int]()
    for index in 0..<inputArray.count {
        if inputArray[index] == elemToReplace {
            tempArrray.append(substitutionElem)
        } else {
            tempArrray.append(inputArray[index])
        }
    }
    return tempArrray
}

let inputArray = [1, 2, 1, 1, 18, 2, 5, 5, 5, 3]
print("\nQuestion 7: \n\n The array after sorted: \(bearrayReplace(inputArray, 1, 3))")

