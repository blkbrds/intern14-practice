import UIKit

class Mang1c {

    var array: [Int]
    init(array : [Int]) {
        self.array = array
    }
    
    func display() {
        for val in array {
            print(val)
        }
    }
    
    func minMax () -> (min: Int, max: Int) {
        var min = array[0]
        var max = array[0]
        for i in 1..<(array.count) {
            if min > array[i]{
                min = array[i]
            }
            if max < array[i] {
                max = array[i]
            }
        }
        return (min, max)
    }
    
    func displayMinMax() {
        print("Max value: \(minMax().max) \nMin value: \(minMax().min)")
    }
}
