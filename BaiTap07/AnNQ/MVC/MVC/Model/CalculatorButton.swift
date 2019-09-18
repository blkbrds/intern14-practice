//
//  CalculatorButton.swift
//  MVC
//
//  Created by MBA0217 on 9/3/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation

class DataResult {
    static let shared = DataResult()
    var number: Double = 0
    var result: Double = 0
    
    func calculateResult(operation: MathOperation) {
        switch operation {
        case .plus:
            result += number
        case .sub:
            result -= number
        case .mul:
            result *= number
        case .div:
            result /= number
        case .result: result = number
        case .reset: result = 0
        }
        number = 0
    }
    
}

enum MathOperation: Int {
    case plus
    case sub
    case mul
    case div
    case result
    case reset
}
