//: Playground - noun: a place where people can play

import UIKit

func shuffledArrNumber(arrayNumber: Array<Int>) -> Array<Int> {
    
    var swapArray:[Int] = arrayNumber
    for element in 0..<swapArray.count {
        let randomValue: Int = Int(arc4random_uniform(UInt32(swapArray.count-1)))
        (swapArray[element], swapArray[randomValue]) = (swapArray[randomValue], swapArray[element])
    }
    
    return swapArray
}

var array:[Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var ramdomShuffled:[Int]

for index in 1...10 {
    ramdomShuffled = shuffledArrNumber(arrayNumber: array)
    print("Random array : \(ramdomShuffled)")
}
