import UIKit

/**
 *  Mang1c class
 **/
class Mang1c {
    var arr: [Int]
    
    init(_ arr : [Int]) {
        self.arr = arr
    }
    
    func printArr () {
        for val in arr {
            print(val)
        }
    }
    
    func getMinMax () -> (min: Int, max: Int) {
        var min = arr[0]
        var max = arr[0]
        for i in 1..<(arr.count) {
            if min > arr[i]{
                min = arr[i]
            }
            if max < arr[i] {
                max = arr[i]
            }
        }
        return (min, max)
    }
}

// Test
var arr = Mang1c([4,2,1,5,8,9])
arr.printArr()
print("Get min max of array: \(arr.getMinMax())")
