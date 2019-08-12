//
//  Operation.swift
//  MVC
//
//  Created by Nguyen Duong on 7/4/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

final class OperationModel {

    static let shared = OperationModel()

    private init() {}

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var tempOperation:Int = 0
    var performingMath: Bool = true
    var operation = 0
    var operations = [Int]()
    var arrayNumber = [Double]()

    func cong(_ number1: Double, _ number2: Double) -> Double {
        return number1 + number2
    }

    func tru(_ number1: Double, _ number2: Double) -> Double {
        return number1 - number2
    }

    func nhan(_ number1: Double, _ number2: Double) -> Double {
        return number1 * number2
    }

    func chia(_ number1: Double, _ number2: Double) -> Double {
        return number1 / number2
    }
}
