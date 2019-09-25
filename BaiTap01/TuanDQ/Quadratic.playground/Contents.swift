//: Playground - noun: a place where people can play

import UIKit

func quadraticEquation(a firstNo:Int, b secondNo: Int, c thirthNo: Int) -> (msg: String, result: [Double]) {
    
    if (firstNo == 0) {
        return ("the equation is not quadratic.", [])
    } else {
        if (secondNo == 0) {
            if (thirthNo == 0) {
                return ("", [0])
            } else{
                return ("Have no result.", [])
            }
        } else {
            let discriminant = Double(secondNo * secondNo - 4 * firstNo * thirthNo)
            if (discriminant < 0) {
                return ("Have no result.", [])
            } else if (discriminant == 0) {
                return ("", [Double(-1 * secondNo) / Double(2 * firstNo)])
            }
            return ("", [(Double(-1 * secondNo) + sqrt(discriminant)) / Double(2 * firstNo),
                (Double(-1 * secondNo) - sqrt(discriminant)) / Double(2 * firstNo)])
        }
    }
}

let quadraticResult = quadraticEquation(a: 10, b: 17, c: 6)
if (quadraticResult.msg.isEmpty) {
    for resultNo in quadraticResult.result {
        print("Quadratic result: \(resultNo)")
    }
} else {
    print("\(quadraticResult.msg)")
}