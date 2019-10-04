import UIKit

/**
 *  Replace array value
 *
 *  @param [Int] inputArray       [Input array]
 *  @param Int   elemToReplace    [Element to replace]
 *  @param Int   substitutionElem [Substitution element]
 *
 *  @return area
 */
func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var replaceArray = inputArray
    for (key, val) in inputArray.enumerated() {
        if val == elemToReplace {
            replaceArray[key] =  substitutionElem
        }
    }
    return replaceArray
}

// Test
print(arrayReplace(inputArray: [1, 2, 1], elemToReplace: 1, substitutionElem: 3))
print(arrayReplace(inputArray: [1, 2, 1, 2, 5, 7, 2], elemToReplace: 2, substitutionElem: 6))
