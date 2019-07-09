//
//  Calculator.swift
//  BaiTapMVC
//
//  Created by PCI0001 on 7/4/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Calculator: UIViewController {
    @IBOutlet private weak var screenLabel: UILabel!
    @IBOutlet private var numberButton: [UIButton]!
    @IBOutlet private var operatorButton: [UIButton]!
    @IBOutlet private weak var acButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    var operation: MathOperator = .ac
    var num1: Double = 0
    var num2: Double = 0
    var result: Double = 0
    var stackNumber: [Double] = [0]
    var stackOperator: [MathOperator] = [.add]

    enum MathOperator: Int {
        case add = 11
        case sub
        case mul
        case div
        case equal
        case ac
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acButton.layer.borderWidth = 1
        acButton.layer.cornerRadius = acButton.frame.width / 2
        equalButton.layer.borderWidth = 1
        equalButton.layer.cornerRadius = equalButton.frame.width / 2
        screenLabel.layer.borderWidth = 2
        
        for i in numberButton {
            i.layer.borderWidth = 1
            i.layer.cornerRadius = i.frame.width / 2
        }
        
        for i in operatorButton {
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            i.layer.cornerRadius = i.frame.width / 2
        }
    }
    
    func calculate() {
        if stackOperator[0] == .add {
            result = stackNumber[0] + stackNumber[1]
            screenLabel.text = String(result)
            stackNumber.append(result)
            stackNumber.remove(at: 0)
            stackNumber.remove(at: 0)
            num2 = stackNumber[0] + num1
            num1 = 0
        } else if stackOperator[0] == .sub {
            if stackNumber[0] == 0 {
                result = stackNumber[1]
                screenLabel.text = String(result)
                stackNumber.append(result)
                stackNumber.remove(at: 0)
                stackNumber.remove(at: 0)
                num2 = stackNumber[0] + num1
                num1 = 0
            } else {
                result = stackNumber[0] - stackNumber[1]
                screenLabel.text = String(result)
                stackNumber.append(result)
                stackNumber.remove(at: 0)
                stackNumber.remove(at: 0)
                num2 = stackNumber[0] + num1
                num1 = 0
            }
        } else if stackOperator[0] == .mul {
            if stackNumber[0] == 0 {
                stackNumber[0] = 1
                result = stackNumber[0] * stackNumber[1]
                screenLabel.text = String(result)
                stackNumber.append(result)
                stackNumber.remove(at: 0)
                stackNumber.remove(at: 0)
                num1 = 0
            } else {
                result = stackNumber[0] * stackNumber[1]
                screenLabel.text = String(result)
                stackNumber.append(result)
                stackNumber.remove(at: 0)
                stackNumber.remove(at: 0)
                num1 = 0
            }
        } else if stackOperator[0] == .div {
            if stackNumber[0] == 0 && stackNumber.count == 1 {
                stackNumber[0] = 1
                if stackNumber[0] == 0 && stackNumber[1] == 0{
                    screenLabel.text = "Error"
                    reset()
                } else {
                    result = stackNumber[0] / stackNumber[1]
                    screenLabel.text = String(result)
                    stackNumber.append(result)
                    stackNumber.remove(at: 0)
                    stackNumber.remove(at: 0)
                    num1 = 0
                }
            } else {
                if stackNumber[1] == 0 {
                    screenLabel.text = "Error"
                    reset()
                } else {
                    result = stackNumber[0] / stackNumber[1]
                    screenLabel.text = String(result)
                    stackNumber.append(result)
                    stackNumber.remove(at: 0)
                    stackNumber.remove(at: 0)
                    num1 = 0
                }
            }
        }
    }
    
    func handleOperator() {
        stackOperator.append(operation)
        if stackOperator.count > 2 {
            stackOperator.remove(at: 0)
        }
    }
    
    func reset() {
        operation = .ac
        num1 = 0
        result = 0
        num2 = 0
        stackNumber = [0]
        stackOperator = [.add]
    }
    
    @IBAction func numberButtonTouchUpInside(_ sender: UIButton) {
        if stackOperator[0] == .sub && stackOperator[1] == .sub && stackNumber[0] == 0 {
            num1 = -(num1 * 10 + Double(sender.tag - 1))
            screenLabel.text = String(num1)
        } else {
            num1 = num1 * 10 + Double(sender.tag - 1)
            screenLabel.text = String(num1)
        }
    }
    
    @IBAction func operatorButtonTouchUpInside(_ sender: UIButton) {
        stackNumber.append(num1)
        guard let mathOperation = MathOperator(rawValue: sender.tag) else { return }
        operation = mathOperation
        switch mathOperation {
        case .add:
            handleOperator()
            calculate()
        case .sub:
            if stackNumber[0] == 0 {
                handleOperator()
                stackOperator[0] = .sub
                calculate()
            } else {
                handleOperator()
                calculate()
            }
        case .mul:
            handleOperator()
            calculate()
        case .div:
            handleOperator()
            calculate()
        case .equal:
            if stackOperator.count >= 2 && stackNumber.count >= 2 {
                stackOperator.remove(at: 0)
                calculate()
                reset()
            } else if stackOperator.count < 2 && stackNumber.count >= 2 {
                screenLabel.text = String(num1)
                reset()
            }
        case .ac:
            reset()
            screenLabel.text = "0.0"
        }
    }
}
