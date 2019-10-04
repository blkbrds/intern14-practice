import UIKit

/**
 *  List Fibonaci
 *
 *  @param Int n [number of Fibonaci]
 *
 *  @return Int
 */
func listFibonaci(n : Int) -> Int {
    if n == 0 {
        return 0
    }
    if (n == 1 || n == 2) {
        return 1
    }
    return (listFibonaci(n: n - 1) + listFibonaci(n: n - 2))
}

/**
 *  List Fibonaci
 *
 *  @param Int n [number of Fibonaci]
 *
 *  @return Equation
 */
func getTotalFibonaci(n : Int) -> Int {
    if n == 0 {
        return 0
    }
    var total = 0
    for n in 1...n {
        total += listFibonaci(n: n)
    }
    return total
}


// Get list Fibonaci
for n in 1...10 {
    print("Number \(n):", listFibonaci(n: n))
}

// Get total Fibonaci
print(getTotalFibonaci(n: 10))
