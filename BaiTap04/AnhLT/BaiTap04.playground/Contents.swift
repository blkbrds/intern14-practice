import UIKit
//BaiTap01
func calculationOfAreaAndVolume(r: Double) -> (area: Double, volume: Double) {
    return (4 * Double.pi * pow(r, 2), (4/3) * Double.pi * pow(r, 3))
}
calculationOfAreaAndVolume(r : 6)

//BaiTap02
enum EquationType{
    case firstOrderEq(Double)
    case noResult
    case eqHasOneResult(Double)
    case eqHasTwoResult(Double, Double)
}
func quadraticEq(a: Double, b: Double, c: Double) -> EquationType
{
    if a == 0
    {
        return .firstOrderEq(-c / b)
    }
    else{
        let delta = pow(b, 2) - 4 * a * c
        
        if delta > 0 {
            return .eqHasTwoResult ((-b + sqrt(delta)) / 2 * a, (-b - sqrt(delta)) / 2 * a)
        }
        else if delta < 0 {
            return .noResult
        }
        else {
            return .eqHasOneResult(-b / 2 * a)
        }
    }
}
switch quadraticEq(a: 0, b: 2, c: 2) {
case .firstOrderEq(let x):
    print ("This equation has one value that is \(x)")
case .noResult:
    print ("This equation has no result")
case .eqHasOneResult(let x1):
    print ("This equation has one result that is \(x1)")
case.eqHasTwoResult(let x1, let x2):
    print ("This equation has two value that is \(x1) and\(x2)")
}


//BaiTap03
enum Equations{
    case equationsHasInfiniteResult
    case equationsHasOneResult(Double, Double)
    case noResult
}
func Calculation(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) -> Equations{
    let D = a1 * b2 - a2 * b1
    let Dx = c1 * b2 - c2 * b1
    let Dy = a1 * c2 - a2 * c1
    if (D == 0 && c1 == c2 && c1 == 0) {
        
        return .equationsHasInfiniteResult
    }
    else if (c1 != c2) {
        return .noResult
    }
    else {
        return .equationsHasOneResult(Dx / D, Dy / D)
    }
    
}
switch Calculation(a1: 1, b1: 3, c1: 2, a2: 4, b2: 12, c2: 2){
case.noResult:
    print("This equations has no result")
case.equationsHasInfiniteResult:
    print("This equations has infinite result")
case.equationsHasOneResult(let x, let y):
    print("This equations has result that is x = \(x) and y = \(y)" )
}


//BaiTap04
func fibonacci(n: Int) -> (arrayNumb: [Int], sum: Int) {
    var a = 0
    var b = 1
    var next = 0
    var sum = 0
    var arrayNumb: [Int] = []
    for i in 0...n {
        if i <= 1 {
            next = i
        } else {
            next = a + b
            a = b
          b = next
        }
        arrayNumb.append(next)
        sum += next
    }
    return (arrayNumb, sum)
}
let result = fibonacci(n: 50)
print("Day fibonacci: \(result.arrayNumb). \nTong so fibonacci: \(result.sum)")


//Sin(x) Taylor
func factorial(_ n: Double) -> Double {
    if n > 1 {
        return n*factorial(n-1)
    } else {
        return 1.0
    }
}

func sinx (_ x: Double,_ n: Int) -> Double {
    var sinx = 0.0
    for i in 0..<n {
        sinx += pow(-1, Double(i)) * pow(x, Double(2 * i + 1)) / factorial(Double(2 * i + 1))
    }
    return sinx
}
func cosx (_ x: Double,_ n: Int) -> Double {
    return sqrt(1 - pow(sinx(x, n), 2))
}
print("""
    4.3/Sinx, Cosx bằng công thức Chuỗi Taylor:
    Sin(0.3) = \(sinx(0.3, 10))
    Cos(0.3) = \(cosx(0.3, 10))
    """)

//BaiTap05
func sequenceOfString(_ momstring: String, _ sonString: String ) -> Int{
    return (Int(momstring.components(separatedBy: sonString).count - 1))
}
print("The number of occurrences of Sonstring in string: \(sequenceOfString("momomomommmmmmmmooooomomm", "mo"))")

//BaiTap06

func arrayNumb(_ arraynumber:Array<Int>) ->Array<Int>{
    return arraynumber.shuffled()
}
print("Random number in array \(arrayNumb([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))")

//BaiTap07
func arrayReplace (_ inputArray:Array<Int>, elemToReplace: Int, substitutionElem: Int) -> Array<Int>{
    
    var newArray = [Int]()
    for i in 0..<inputArray.count {
        
        if inputArray[i] == elemToReplace {
            newArray.append(substitutionElem)
        }else{
            newArray.append(inputArray[i])
        }
    }
    return newArray
}

let inputArray = [1, 2, 1]
arrayReplace(inputArray, elemToReplace: 1,substitutionElem: 3)
print("Array has been replaced to \(arrayReplace(inputArray, elemToReplace: 1,substitutionElem: 3))")

