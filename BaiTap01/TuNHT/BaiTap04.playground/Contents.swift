import UIKit

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
listOfFibonacci(n: 50)

