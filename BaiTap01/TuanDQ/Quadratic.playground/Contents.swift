//: Playground - noun: a place where people can play

import UIKit

func quadraticEquation(a firstNo:Float, b secondNo: Float, c thirthNo: Float) -> (msg: String?, result: [Float]) {
    
    switch (firstNo == 0, secondNo == 0, thirthNo == 0) {
    case (true, false, _):
        return simpleEquation(b: secondNo, c: thirthNo)
    default:
        if (secondNo == 0) {
            if (thirthNo == 0) {
                return (nil, [0])
            } else{
                return ("Have no result.", [])
            }
        } else {
            let discriminant = secondNo * secondNo - 4 * firstNo * thirthNo
            if (discriminant < 0) {
                return ("Have no result.", [])
            } else if (discriminant == 0) {
                return (nil, [(-1 * secondNo) / (2 * firstNo)])
            }
            return (nil, [((-1 * secondNo) + sqrt(discriminant)) / (2 * firstNo),
                ((-1 * secondNo) - sqrt(discriminant)) / (2 * firstNo)])
        }
    }
}

func simpleEquation(b firstNo:Float, c secondNo: Float) -> (msg: String?, result: [Float]) {
    if (firstNo == 0) {
        if (secondNo == 0) {
            return ("Have a lot of result.", [])
        } else {
            return ("Have no result.", [])
        }
    } else {
        return (nil, [-1 * secondNo / firstNo])
    }
}


let quadraticResult = quadraticEquation(a: 10, b: 17, c: 6)
if (quadraticResult.msg == nil) {
    for resultNo in quadraticResult.result {
        print("Quadratic result: \(resultNo)")
    }
} else {
    print("\(quadraticResult.msg)")
}
