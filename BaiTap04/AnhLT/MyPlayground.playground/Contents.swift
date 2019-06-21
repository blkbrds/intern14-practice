import UIKit
func fibonacci(n: Int) -> (arrayNumb: [Int], sum: Int) {
    var a = 0
    var b = 1
    var next = 0
    var sum = 0
    var arrayNumb: [Int] = []
    for i in 0...n {
        if i <= 1 {
            next = i
        } else {
            next = a + b
            a = b
          b = next
        }
        arrayNumb.append(next)
        sum += next
    }
//    print(arrayNumb)

    return (arrayNumb, sum)
    
}
let result = fibonacci(n: 100)
print("Day fibonacci: \(result.arrayNumb). \nTong so fibonacci: \(result.sum)")



