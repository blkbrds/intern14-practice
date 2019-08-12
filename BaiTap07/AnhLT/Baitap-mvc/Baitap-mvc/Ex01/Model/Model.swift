//
//  File.swift
//  Baitap-mvc
//
//  Created by PCI0013 on 7/8/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import Foundation

class Data {
    static let shared = Data()
    
    private init() {}
    var numberInStack: [Double] = [0]
    var result: Double = 0
    
    func calculateResult(operation: MathOperation) {
        switch operation {
        case .plus: result = numberInStack[0] + numberInStack[1]
        case .minus: result = numberInStack[0] - numberInStack[1]
        case .mul: result = numberInStack[0] * numberInStack[1]
        case .div: result = numberInStack[0] / numberInStack[1]
        case .equal: print(result)
        case .reset: result = 0
        }
        numberInStack.remove(at: 0)
        numberInStack.remove(at: 0)
    }
}

enum MathOperation: Int {
    case plus
    case minus
    case mul
    case div
    case equal
    case reset
}
