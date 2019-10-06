import UIKit

let inputArray = [0, 1, 2, 3, 4, 5 ,6 ,7 ,8 ,9]

func shuffledArray(inputArray: Array<Int>) ->  Array<Int> {
    var shuffledArray:[Int] = inputArray
    for value in 0..<shuffledArray.count {
        shuffledArray.swapAt(value, Int.random(in: 0..<inputArray.count))
    }
    return shuffledArray
}

// Test
print(shuffledArray(inputArray: inputArray))
