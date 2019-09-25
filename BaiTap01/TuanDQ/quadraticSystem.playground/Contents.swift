//: Playground - noun: a place where people can play

import UIKit

func quadraticSystemWithTwoHidden(a1 firstNo: Float, b1 secondNo: Float, c1 thirthNo: Float,
                                     a2 fourthNo: Float, b2 fifthNo: Float, c2 sixthNo: Float) -> (String, [Float]) {
    if (firstNo == 0 && fourthNo == 0) || (secondNo == 0 && fifthNo == 0) {
        return ("This is not quadratic system with 2 hiddens.", [])
    }
    
    switch (firstNo == 0, fourthNo == 0, secondNo == 0, fifthNo == 0) {
    case (true, false, _, _):
        return ("", [(sixthNo - (fifthNo * thirthNo) / secondNo) / (fourthNo),
            Float(thirthNo / secondNo)])
    case (false, true, _, _):
        return ("", [Float(thirthNo - (secondNo * sixthNo) / fifthNo) / (firstNo),
            (sixthNo / fifthNo)])
    case (_, _, true, false):
        return ("", [(thirthNo / firstNo),
            (sixthNo - (fourthNo * thirthNo) / fifthNo) / (fourthNo)])
    case (_, _, false, true):
        return ("", [(sixthNo / fourthNo),
            (thirthNo - (fifthNo * sixthNo) / fourthNo) / Float(firstNo)])
    default:
        return ("", [(secondNo * (thirthNo * fourthNo - sixthNo * firstNo)) /
            (firstNo * (secondNo * fourthNo - firstNo * fifthNo)),
            (thirthNo * fourthNo - sixthNo * firstNo) /
                (secondNo * fourthNo - firstNo * fifthNo)])
    }
}

let quadraticSystemResult = quadraticSystemWithTwoHidden(a1: 5, b1: -7, c1: 9, a2: -4, b2: 6, c2: 0)

if (quadraticSystemResult.0.isEmpty) {
    for result in quadraticSystemResult.1 {
        print("Result : \(result)")
    }
} else {
    print("Result : \(quadraticSystemResult.0)")
}
