import UIKit

// Baitap 1
func calculation(r: Double) -> (area: Double, volume: Double) {
    return (4 * Double.pi * pow(r, 2), (4/3) * Double.pi * pow(r, 3))
}
calculation(r: 5)


// Baitap 2
enum Equation {
    case firstOrderEq
    case noSolution
    case oneSolution(Double)
    case twoSolutions(Double, Double)
}

func secondOrderEq(a: Double, b: Double, c: Double) -> Equation {
    if a==0 {
        return .firstOrderEq }
    else {
        let delta = pow(b, 2) - 4 * a * c
        if delta < 0 {
            return .noSolution }
        else if delta == 0 {
            return .oneSolution(-b/2*a) }
        else {
            return .twoSolutions((-b + sqrt(delta))/(2*a), (-b - sqrt(delta))/(2*a)) }
    }
}

switch secondOrderEq(a: 2, b: 5, c: 3) {
case .firstOrderEq:
    print("It's a first order equation")
case .noSolution:
    print("This equation has no solution")
case .oneSolution(let x1):
    print("This equation has one solution \(x1)")
case .twoSolutions(let x1, let x2):
    print("This equation has two solutions \(x1) and \(x2)")
}


// Baitap 3
enum Equations {
    case noSolution
    case oneSolution(Double, Double)
    case countlessSolution
}

func calculateEq(a1: Double, b1: Double, c1:Double, a2: Double, b2: Double, c2: Double) -> Equations {
    if (a1*b2-a2*b1 == 0 && c1 == c2 && c2 == 0) {
        return .countlessSolution
    }
    else if (a1*b2-a2*b1 == 0 && c1 != c2){
        return .noSolution
    }
    else {
        return .oneSolution((c1*b2-c2*b1)/(a1*b2-a2*b1), (a1*c2-a2*c1)/(a1*b2-a2*b1))
    }
}

switch calculateEq(a1: 2, b1: 3, c1: 1, a2: 3, b2: 4, c2: 2) {
case .noSolution:
    print("This equation has no solution")
case .oneSolution(let x1, let x2):
    print("This equation has solution: \(x1) and \(x2)")
case .countlessSolution:
    print("This equation has countless solution")
}


// Baitap 4
// Sum of 50 fibonaccies
func fibonacci(n: Double) -> Double {
    return (pow((1.0 + sqrt(5.0)), n) - pow((1.0 - sqrt(5.0)), n)) / (pow(2.0, n) * sqrt(5.0))
}

func sum(n: Double) -> Double {
    return fibonacci(n: n + 2.0) - 1.0
}

Int(fibonacci(n: 50))
Int(sum(n: 50))

// List of 50 fibonaccies
func listOfFibonacci(n: Double) -> Double {
    var myArray: [Int] = []
    for i in 0 ... Int(n) {
        let fibonacyValue = (pow((1.0 + sqrt(5.0)), Double(i)) - pow((1.0 - sqrt(5.0)), Double(i))) / (pow(2.0, Double(i)) * sqrt(5.0))
        myArray.append(Int(fibonacyValue))
    }
    print(myArray)
    
    return (pow((1.0 + sqrt(5.0)), n) - pow((1.0 - sqrt(5.0)), n)) / (pow(2.0, n) * sqrt(5.0))
}
listOfFibonacci(n: 50	)

// Calculate sin(x), cos(x) with the  Taylor formula
func calculateFactorial(_ n: Double) -> Double {
    if n > 1 {
        return n * calculateFactorial(n - 1)
    } else {
        return 1.0
    }
}

func sinx(_ x: Double,_ n: Int) -> Double {
    var sinx = 0.0
    for i in 0..<n {
        sinx += pow(-1, Double(i)) * pow(x, Double(2 * i + 1)) / calculateFactorial(Double(2 * i + 1))
    }
    return sinx
}

func cosx(_ x: Double,_ n: Int) -> Double {
    return sqrt(1 - pow(sinx(x, n), 2))
}
print("Calculate sin(x), cos(x) with the  Taylor formula: Sin(0.5) = \(sinx(0.5, 10)); Cos(0.5) = \(cosx(0.5, 10))")


// Baitap 5
func string(_ string: String,_ subString: String) -> Int {
    return Int(string.components(separatedBy: subString).count - 1)
}
print("The number of occurrences of the Substring in the String: \(string("abaaaabbbabababbaaabababa", "ab"))")


// Baitap 6
func randomArray(_ array: Array<Int>) -> Array<Int> {
    return array.shuffled()
}
print("Random permutation of elements in the array: \(randomArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))")


// Baitap 7
let inputArray = [1, 2, 1]
func  arrayReplace(_ inputArray: Array<Int>,_ elemToReplace: Int,_ substitutionElem: Int) -> Array<Int> {
    var array = [Int]()
    for index in 0..<inputArray.count {
        if inputArray[index] == elemToReplace {
            array.append(substitutionElem)
        } else {
            array.append(inputArray[index])
        }
    }
    return array
}

print("The new array: \(arrayReplace(inputArray, 1, 3))")
