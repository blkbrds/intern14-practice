import UIKit


//Bai tap 10
class A {
    private(set) var number: Int
    init?(number: Int){
        if number >= 0 {
            self.number = number
        }
        else {
            return nil
        }
    }
    func sumOfNumber () -> Int {
        var result: Int = 0
        for i in 1...number {
            result += i
        }
    print("The sum of \(number) integers is \(result)")
    return result
    }
    
   }
if let a = A(number: -100) {
    a.sumOfNumber()
}
else {
    print("This is not an array of integers")
}

