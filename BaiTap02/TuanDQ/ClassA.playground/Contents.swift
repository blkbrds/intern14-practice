import UIKit

class A {
    func sum(n: Int) -> Int {
        if (n % 2 == 0) {
            return (n+1) * (n/2)
        }
        return (n+1) * (n/2) + (n/2 + 1)
    }
}


let demo: A = A()
print("Total : \(demo.sum(n: 4))")
