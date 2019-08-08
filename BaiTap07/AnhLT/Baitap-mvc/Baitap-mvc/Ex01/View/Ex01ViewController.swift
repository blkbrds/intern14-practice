//
//  Ex01ViewController.swift
//  Baitap-mvc
//
//  Created by PCI0013 on 7/4/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    @IBOutlet var numberOutlet: [UIButton]!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet var operatorsOultet: [UIButton]!
    @IBOutlet weak var screenNumber: UILabel!
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var performmingMath = true
    var operators: [MathOperation] = [.plus]
    var operand: MathOperation = .reset

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtons(numberOutlet)
        configButtons(operatorsOultet)

        view.backgroundColor = .black
    }
    
    func configButtons(_ button: [UIButton]) {
        for i in button {
            i.layer.borderWidth = 2
            i.layer.cornerRadius = i.bounds.height / 2
        }
        
        acButton.layer.borderWidth = 2
        acButton.layer.cornerRadius = acButton.bounds.height / 2
        resultButton.layer.cornerRadius = resultButton.bounds.height / 2
        resultButton.layer.borderWidth = 2
    }
    
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        if operators[0] == .minus && operators[1] == .minus && Data.shared.numberInStack[0] == 0 {
            firstNumber = -(firstNumber * 10 + Double(sender.tag))
            screenNumber.text = String(Int(firstNumber))
        } else {
            firstNumber = firstNumber * 10 + Double(sender.tag)
            screenNumber.text = String(Int(firstNumber))
        }
//        screenNumber.text = String(Int(firstNumber))
    }
    
    func configOperatorsArray() {
        operators.append(operand)
        if operators.count > 2 {
            operators.remove(at: 0)
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "Error", message: "Cannot divide by zero", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func reset() {
        operand = .reset
        firstNumber = 0
        secondNumber = 0
        Data.shared.result = 0
        Data.shared.numberInStack = [0]
        operators = [.plus]
    }
    
    func calculate() {
        if operators[0] == .plus {
            Data.shared.calculateResult(operation: .plus)
            screenNumber.text = String(Int(Data.shared.result))
            Data.shared.numberInStack.append(Data.shared.result)
            secondNumber = Data.shared.numberInStack[0] + firstNumber
            firstNumber = 0
        } else if operators[0] == .minus {
            if Data.shared.numberInStack[0] == 0 {
                Data.shared.result = Data.shared.numberInStack[1]
                screenNumber.text = String(Int(Data.shared.result))
                Data.shared.numberInStack.append(Data.shared.result)
                Data.shared.numberInStack.remove(at: 0)
                Data.shared.numberInStack.remove(at: 0)
                secondNumber = Data.shared.numberInStack[0] + firstNumber
                firstNumber = 0
            } else {
                Data.shared.calculateResult(operation: .minus)
                screenNumber.text = String(Int(Data.shared.result))
                Data.shared.numberInStack.append(Data.shared.result)
                secondNumber = Data.shared.numberInStack[0] + firstNumber
                firstNumber = 0
            }
        } else if operators[0] == .mul {
            if Data.shared.numberInStack[0] == 0 {
                Data.shared.calculateResult(operation: .mul)
                Data.shared.numberInStack[0] = 1
                screenNumber.text = String(Int(Data.shared.result))
                Data.shared.numberInStack.append(Data.shared.result)
                firstNumber = 0
            } else {
                Data.shared.calculateResult(operation: .mul)
                screenNumber.text = String(Int(Data.shared.result))
                Data.shared.numberInStack.append(Data.shared.result)
                firstNumber = 0
            }
        } else if operators[0] == .div {
            if Data.shared.numberInStack[0] == 0 && Data.shared.numberInStack.count == 1 {
                Data.shared.numberInStack[0] = 1
                if Data.shared.numberInStack[0] == 0 && Data.shared.numberInStack[1] == 0 {
                    alert()
                } else {
                    Data.shared.calculateResult(operation: .div)
                    screenNumber.text = "\(Data.shared.result)"
                    Data.shared.numberInStack.append(Data.shared.result)
                    firstNumber = 0
                }
            } else {
                if Data.shared.numberInStack[1] == 0 {
                    alert()
                } else {
                    Data.shared.calculateResult(operation: .div)
                    screenNumber.text = "\(Data.shared.result)"
                    Data.shared.numberInStack.append(Data.shared.result)
                    firstNumber = 0
                }
            }
        }
    }
    
    @IBAction private func operandTouchUpInside(_ sender: UIButton) {
        Data.shared.numberInStack.append(firstNumber)
        guard let mathOperation = MathOperation(rawValue: sender.tag) else { return }
        operand = mathOperation
        switch mathOperation {
        case .plus:
            configOperatorsArray()
            calculate()
        case .minus:
            if Data.shared.numberInStack[0] == 0 {
                configOperatorsArray()
                operators[0] = .minus
                calculate()
            } else {
                configOperatorsArray()
                calculate()
            }
        case .mul:
            configOperatorsArray()
            calculate()
        case .div:
            configOperatorsArray()
            calculate()
        case .equal:
            if operators.count >= 2 && Data.shared.numberInStack.count >= 2 {
                operators.remove(at: 0)
                calculate()
                reset()
            } else if operators.count < 2 && Data.shared.numberInStack.count >= 2 {
                screenNumber.text = "\(firstNumber)"
            }
        case .reset:
            reset()
            screenNumber.text = "0"
        }
    }
}
