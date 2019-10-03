import UIKit

let originString = "abaaaabbbabababbaaababababbbababaaaaab"
let subString = "ab"

/**
 * Count number of occurrences
 *
 * @param String originString [Origin string]
 * @param String subString    [Sub string]
 *
 * @return Int
 */
func countInstances(originString: String, subString: String) -> Int {
    var searchRange = originString.startIndex..<originString.endIndex
    var count = 0
    while let range = originString.range(of: subString, options: [], range: searchRange) {
        searchRange = range.upperBound..<searchRange.upperBound
        count += 1
    }
    return count
}

// Count number of occurrences
print("Solution 1: \(originString.components(separatedBy: subString).count-1)")

print("Solution 2: \(countInstances(originString: originString, subString: subString))")
