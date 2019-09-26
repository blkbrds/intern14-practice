//: Playground - noun: a place where people can play

import UIKit

var originalStr = "abaaaabbbabababbaaabababa...."
let subStr = "ab"

let presentNumber = originalStr.componentsSeparatedByString(subStr)
print("Total number : \(presentNumber.count - 1)")