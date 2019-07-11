//
//  CaculatorViewController.swift
//  MVC
//
//  Created by PCI0008 on 7/3/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet private var calculateButtons: [UIButton]!
    
    private var operation: Opera = .revert
    private var number1: Double = 0
    private var number2: Double = 0
    private var result: Double = 0
    private var arrayNumber: [Double] = [0]
    private var arrayCalculate: [Opera] = [.plus]
    
    //MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cornerButton(numberButtons)
        cornerButton(calculateButtons)
    }
    
    // MARK: - Private funtions corner
    private func cornerButton(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    // MARK: - IBActions
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        if arrayCalculate[0] == .minus && arrayCalculate[1] == .minus && arrayNumber[0] == 0 {
            number1 = 0 - (number1 * 10 + Double(sender.tag))
            resultLabel.text = String(number1)
        } else {
            number1 = number1 * 10 + Double(sender.tag)
            resultLabel.text = String(number1)
        }
    }
    
    //MARK: - resetCalculate
    private func resetCalculate() {
        arrayCalculate.append(operation)
        if arrayCalculate.count > 2 {
            arrayCalculate.remove(at: 0)
        }
    }
    
    //MARK: - buttonEqual
    private func equalButton() {
        operation = .plus
        number1 = 0
        number2 = 0
        result = 0
        arrayNumber.removeAll()
        arrayNumber.append(0)
        arrayCalculate = [.plus]
    }
    
    //MARK: Calculator
    private func calculator() {
        if arrayCalculate[0] == .plus {
            result = arrayNumber[0] + arrayNumber[1]
            resultLabel.text = String(result)
            arrayNumber.append(result)
            arrayNumber.removeSubrange(0...1)
            number2 = arrayNumber[0] + number1
            number1 = 0
        } else if arrayCalculate[0] == .minus {
            if arrayNumber[0] == 0 {
                result = arrayNumber[1]
                resultLabel.text = String(result)
                arrayNumber.append(result)
                arrayNumber.removeSubrange(0...1)
                number2 = arrayNumber[0] + number1
                number1 = 0
            } else {
                result = arrayNumber[0] - arrayNumber[1]
                resultLabel.text = String(result)
                arrayNumber.append(result)
                arrayNumber.removeSubrange(0...1)
                number2 = arrayNumber[0] + number1
                number1 = 0
            }
        } else if arrayCalculate[0] == .mul {
            if arrayNumber[0] == 0 {
                arrayNumber[0] = 1
                result = arrayNumber[0] * arrayNumber[1]
                resultLabel.text = String(result)
                arrayNumber.append(result)
                arrayNumber.removeSubrange(0...1)
                number1 = 0
            } else {
                result = arrayNumber[0] * arrayNumber[1]
                resultLabel.text = String(result)
                arrayNumber.append(result)
                arrayNumber.removeSubrange(0...1)
                number1 = 0
            }
        } else if arrayCalculate[0] == .div {
            if arrayNumber[0] == 0 {
                arrayNumber[0] = 1
                if arrayNumber[0] == 0 {
                    resultLabel.text = "ERROR"
                } else {
                    result = arrayNumber[1] / arrayNumber[0]
                    resultLabel.text = String(result)
                    arrayNumber.append(result)
                    arrayNumber.removeSubrange(0...1)
                    number1 = 0
                }
            } else {
                if arrayNumber[1] == 0 {
                    resultLabel.text = "ERROR"
                } else {
                    result = arrayNumber[0] / arrayNumber[1]
                    resultLabel.text = String(result)
                    arrayNumber.append(result)
                    arrayNumber.removeSubrange(0...1)
                    number1 = 0
                }
            }
        }
    }
    
    @IBAction private func calculateButtonTouchUpInside(_ sender: UIButton) {
        arrayNumber.append(number1)
        guard let calcula = Opera(rawValue: sender.tag) else { return }
        operation = calcula
        switch calcula {
        case .plus, .mul, .div:
            resetCalculate()
            calculator()
        case .minus:
            if arrayNumber[0] == 0 {
                resetCalculate()
                arrayCalculate[0] = .minus
                calculator()
            } else {
                resetCalculate()
                calculator()
            }
        case .equal:
            if arrayCalculate.count >= 2 && arrayNumber.count >= 2 {
                arrayCalculate.remove(at: 0)
                calculator()
                equalButton()
            } else if arrayCalculate.count < 2 && arrayNumber.count >= 2 {
                resultLabel.text = String(number1)
            }
        case .revert:
            equalButton()
            resultLabel.text = "0"
        }
    }
}

enum Opera: Int {
    case plus = 0
    case minus
    case mul
    case div
    case equal
    case revert
}
