import UIKit

class A {
    private var number: Int
    
    init(_ number: Int) {
        self.number = number
    }
    
    func sum() -> Int {
        var sum = 0
        for temp in 1...number {
            sum += temp
        }
        return sum
    }
}

var number = A(10)
print(number.sum())
