import UIKit

// Sum of 50 fibonaccies
func fibonacci(n: Double) -> Double {
    return (pow((1.0 + sqrt(5.0)), n) - pow((1.0 - sqrt(5.0)), n)) / (pow(2.0, n) * sqrt(5.0))
}

func sum(n: Double) -> Double {
    return fibonacci(n: n + 2.0) - 1.0
}

fibonacci(n: 50)
sum(n: 50)

