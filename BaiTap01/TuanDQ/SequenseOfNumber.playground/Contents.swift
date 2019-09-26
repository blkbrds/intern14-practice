//: Playground - noun: a place where people can play

import UIKit

/**
 * Get fibonaci at position.
 */
func getFibonaci(indexNumber : Int) -> Int {
    if (indexNumber <= 0) {
        return 0
    }

    if (indexNumber == 1 || indexNumber == 2) {
        return 1
    }
    
    return getFibonaci(indexNumber - 1) + getFibonaci(indexNumber - 2)
}

/**
 * Get total fibonaci from first number to paticular index.
 */
func getTotalFibonaci(numberOfFibonaci: Int) -> Int {
    var total: Int = 0
    if (numberOfFibonaci <= 0) {
        return 0
    }
    for fibo in 1...numberOfFibonaci {
        total += getFibonaci(fibo)
    }
    return total
}

/**
 * Get sin by Taylor sequense.
 * Based on URL : https://nguyenvanhieu.vn/cach-tinh-sin-cos-trong-c/
 */
func sinByTaylor(x degree: Float) -> Float {

    var n:Int = 0;
    var sin:Float = 0.0
    while (abs(getF(degree, n: n)) > 0.00001) {
        sin += getF(degree, n: n)
        n+=1
    }
    
    return sin
}

/** Calculate elements value. */
func getF(x:Float, n:Int) -> Float {
    var a:Int
    if (n % 2 == 0) {
    a = 1
    } else {
    a = -1
    }
    
    var temp:Float = 1
    for i in 1...(2 * n + 1) {
        temp = temp * x / Float(i)
    }
    return Float(a) * temp;
}

/**
 * Get cos by Taylor sequense.
 * Based on URL : https://nguyenvanhieu.vn/cach-tinh-sin-cos-trong-c/
 */
func cosByTaylor(x degree: Float) -> Float {
    return sqrt(1 - sinByTaylor(x: degree) * sinByTaylor(x: degree))
}

/**
 * Check happy number.
 */
func isHappynumber(n: Int) -> Bool
{
    var slow: Int = n
    var fast: Int = n

    repeat
    {
        //    move slow number by one iteration
        slow = numSquareSum(slow)
        
        //    move fast number by two iteration
        fast = numSquareSum(numSquareSum(fast))
        
    } while (slow != fast)
    
    //    if both number meet at 1, then return true
    return (slow == 1)
}

func numSquareSum(n: Int) -> Int
{
    var squareSum = 0
    var checkNum = n
    while (checkNum > 0)
    {
        squareSum += (checkNum % 10) * (checkNum % 10)
        checkNum = checkNum / 10
    }
    return squareSum;
}

// Get total number of 100 first fibonaci
print("Total 100 first fibonaci are : \(getTotalFibonaci(100)) ")

// Print 100 first fibonaci.
for no in 1...100 {
    print(getFibonaci(no))
}

// Get sin(x) by Taylor formular.
print("sin(x) (based on radian) are : \(sinByTaylor(x: 0.5235))")
print("cos(x) (based on radian) are : \(cosByTaylor(x: 0.5235))")

// Print happy number before 10.000
for number in 1...10000 {
    if (isHappynumber(number)) {
        print("Happy nummer : \(number)")
    }
}

