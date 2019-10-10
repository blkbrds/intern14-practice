import UIKit

/**
 *  A class
 **/
class A {
    var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func sum() -> Int {
        var s = 0
        for i in 1...n {
            s += i
        }
        return s
    }
}

// Test
var s = A(n: 10)
print("S = \(s.sum())")

