import UIKit
// Bai2
enum equationResults{
    case oneResult(Double)
    case noResult
    case doubleResult(Double)
    case twoReslt(Double,Double)
}
func quadraticEquation (a: Double, b: Double, c:Double) -> equationResults {
    let delta = pow(b, 2) - 4*a*c
    if a==0{
        if b==0{
            return .noResult
        } else {
            return .doubleResult(-c/b)
        }
    } else if delta < 0 {
        return .noResult
    } else if delta == 0 {
        return .doubleResult (-b/(2*a))
    } else  {
        return .twoReslt(((-b+sqrt(delta))/(2*a)), ((-b-sqrt(delta))/(2*a)))
    }
}

print(quadraticEquation(a: 0, b: 0, c: -4))
// Bai 3
enum EquationResults{
    case NoResult
    case UnlimitedResult
    case TwoResult(Double, Double)
}
func SuperLativeEquationsTwoHidden (_ a1: Double,_ b1: Double,_ c1: Double,_ a2: Double,_ b2: Double,_ c2:Double)-> EquationResults{
    let D, Dx, Dy :Double
    D = a1 * b2 - a2 * b1
    Dx = c1 * b2 - c2 * b1
    Dy = a1 * c2 - a2 * c1
    if D == 0 {
        if c1==c2 {
            return .UnlimitedResult
        }
        else {
            return .NoResult
        }
    }
    else {
        return .TwoResult(Dx/D, Dy/D)
    }
}
print(SuperLativeEquationsTwoHidden( 1,  2,  3,  3,  4,  5))
// Bai4
func fibonacci(n: Int) -> Int {
    var arrayFibonacci: [Int] = []
    var a: Int = 0
    var b: Int = 1
    var next: Int = 0
    for i in 0..<n {
        if i <= 0 {
            next = i
        } else {
            a = b
            b = next
            next = a + b
        }
        arrayFibonacci.append(next)
    }
    print("The sequence of \(n) first numbers of Fibonacci\(arrayFibonacci)")
    print("The total numbers of \(n) first numbers of Fibonacci \(arrayFibonacci.reduce(0, +))")
    return next
    
}
print(fibonacci(n: 50))




func sum(n: Int) -> Int {
    return fibonacci(n: n + 2) - 1
}


import UIKit

func classifyString (_ parent: String, _ child: String) -> Int {
    return Int(parent.components(separatedBy: child).count - 1)
}
print("The number of apperances of ab in the string abaaaabbbabababbaaabababa is \(classifyString("abaaaabbbabababbaaabababa", "ab"))")
// Bai6
func shuffledArray(unshuffledArray: Array<Int>) -> Array<Int> {
    return unshuffledArray.shuffled()
}
print(shuffledArray(unshuffledArray: [0,1,2,3,4,5,6,7,8,9]))

// Bai 7
func replacingArray(_ oldArray: Array<Int>,_ elemToReplace: Int,_ substitutionElem: Int) -> Array<Int> {
    var newArray: [Int] = []
    for i in 0..<oldArray.count {
        if oldArray[i] == elemToReplace {
            newArray.append(substitutionElem)
        } else {
            newArray.append(oldArray[i])
        }
    }
    return newArray
}
print(replacingArray([1, 2, 1], 1, 3))

