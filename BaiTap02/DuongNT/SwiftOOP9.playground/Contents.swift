import UIKit

class Mang1c {
    private var arrayList: [Int]
    
    init?(_ arrayList: [Int]) {
        if arrayList.count < 1 {
            return nil
        } else {
            self.arrayList = arrayList
        }
    }
    
    func output() {
        print("Array list is: \(arrayList)")
    }
    
    func minMax() -> (min: Int, max: Int) {
        var min = arrayList[0]
        var max = arrayList[0]
        for temp in 1 ..< arrayList.count {
            if max < arrayList[temp] {
                max = arrayList[temp]
            }
            if min > arrayList[temp] {
                min = arrayList[temp]
            }
        }
        return (min, max)
    }
}
var list = Mang1c([1, 2, -3, 9, 8, 11, 22, 0])
if let list = list {
    list.output()
    print("Min: \(list.minMax().min)")
    print("Max: \(list.minMax().max)")
} else {
    print("Array is error!!!!")
}
