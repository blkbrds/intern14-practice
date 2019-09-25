//: Playground - noun: a place where people can play

import UIKit

/**
 * Replace all the occurrences of elemToReplace withsubstitutionElem
 */
func arrayReplace(inp inputArray : [Int], elem elemToReplace: Int, subs substitutionElem: Int) -> [Int] {
    var arReplace = inputArray
    for index in 0..<arReplace.count {
        if(arReplace[index] == elemToReplace) {
            arReplace[index] = substitutionElem
        }
    }
    return arReplace;
}

var inputArray: [Int] = [1, 2, 1]
let elemToReplace = 1
let substitutionElem = 3

let replayResult = arrayReplace(inp: inputArray, elem: elemToReplace, subs: substitutionElem)
print("Array replace : \(replayResult)")