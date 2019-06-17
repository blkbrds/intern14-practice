import UIKit

class Mang1c {
    var integerArray: [Int] = []
    init?(_ integerArray: [Int]) {
        if integerArray.count == 0 {
            print("The array is empty")
            return nil
        } else {
        self.integerArray = integerArray
        }
    }
    func printArray () {
        var addArray: [Int] = []
        for i in integerArray {
            addArray.append(i)
        }
        print(addArray)
    }
    func printMinMax() {
        if let min = integerArray.min(), let max = integerArray.max() {
            print("The max integer in array is \(max) \nThe min intger in array is \(min)")
        } else {}
        
    }

}
if let a = Mang1c([]) {
a.printArray()
a.printMinMax()
} else {}

