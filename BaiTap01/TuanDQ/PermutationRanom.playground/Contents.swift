//: Playground - noun: a place where people can play

import UIKit

func shuffledArrNumber(arrNumber: Array<Int>) -> Array<Int> {
    
    var swapArr:[Int] = arrNumber
    for element in 0..<swapArr.count {
        let randomVal: Int = Int(arc4random_uniform(UInt32(swapArr.count-1)))
        (swapArr[element], swapArr[randomVal]) = (swapArr[randomVal], swapArr[element])
    }
    
    return swapArr
}

var varArr:[Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var ramdomShuffled:[Int]

for index in 1...10 {
    ramdomShuffled = shuffledArrNumber(varArr)
    print("Random array : \(ramdomShuffled)")
}
