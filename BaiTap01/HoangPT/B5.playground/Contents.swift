import UIKit

let originString = "abaaaabbbabababbaaabababa"
let subString = "ab"
let result = originString.components(separatedBy: subString).count-1

// Test
print("The number of occurrences: \(result)")
