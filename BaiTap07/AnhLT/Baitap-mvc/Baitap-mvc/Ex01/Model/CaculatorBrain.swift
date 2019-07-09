//
//  Operator.swift
//  Baitap-mvc
//
//  Created by PCI0013 on 7/5/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Operator: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    class PerformCalculations {
        
        func add(a: Double, b: Double) -> Double {
            let result = a + b
            return result
        }
        func division(a: Double, b: Double) -> Double {
            let result = a / b
            return result
        }
        func subtract(a: Double, b: Double) -> Double {
            let result = a - b
            return result
        }
        func multiplication(a: Double, b: Double) -> Double {
            let result = a * b
            return result
        }
        func squareroot(a: Double) -> Double {
            let result = sqrt(a)
            return result
        }
    }
}
