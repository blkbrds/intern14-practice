//
//  Ex01ViewController.swift
//  Baitap-mvc
//
//  Created by PCI0013 on 7/4/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    var numberInStack: [Double] = [0]
    var operators: [MathOperation] = [.plus]
    var operand: MathOperation = .reset
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var result: Double = 0

    @IBOutlet var numberOutlet: [UIButton]!
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet var operatorsOultet: [UIButton]!
    @IBOutlet weak var screenNumber: UILabel!
    
    var performmingMath = true
    override func viewDidLoad() {
        super.viewDidLoad()
        design(numberOutlet)
        design(operatorsOultet)
    
        view.backgroundColor = .black
        
    }
    
    func design(_ button: [UIButton]) {
        for i in button {
            i.layer.borderWidth = 2
            i.layer.cornerRadius = i.bounds.height / 2
        }
        
        acButton.layer.borderWidth = 2
        acButton.layer.cornerRadius = acButton.bounds.height / 2
        resultButton.layer.cornerRadius = resultButton.bounds.height / 2
        resultButton.layer.borderWidth = 2
    }
    
    @IBAction func numberButtonTouchUpInside (_ sender: UIButton) {
        if operators[0] == .minus && operators[1] == .minus && numberInStack[0] == 0 {
            firstNumber = -(firstNumber * 10 + Double(sender.tag))
            screenNumber.text = String(Int(firstNumber))
        } else {
            firstNumber = firstNumber * 10 + Double(sender.tag)
            screenNumber.text = String(Int(firstNumber))
        }
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
        result = 0
        numberInStack = [0]
        operators = [.plus]
    }
    
    func calculate() {
        if operators[0] == .plus {
            result = numberInStack[0] + numberInStack[1]
            screenNumber.text = String(Int(result))
            numberInStack.append(result)
            numberInStack.remove(at: 0)
            numberInStack.remove(at: 0)
            secondNumber = numberInStack[0] + firstNumber
            firstNumber = 0
        } else if operators[0] == .minus {
            if numberInStack[0] == 0 {
                result = numberInStack[1]
                screenNumber.text = String(Int(result))
                numberInStack.append(result)
                numberInStack.remove(at: 0)
                numberInStack.remove(at: 0)
                secondNumber = numberInStack[0] + firstNumber
                firstNumber = 0
            } else {
                result = numberInStack[0] - numberInStack[1]
                screenNumber.text = String(Int(result))
                numberInStack.append(result)
                numberInStack.remove(at: 0)
                numberInStack.remove(at: 0)
                secondNumber = numberInStack[0] + firstNumber
                firstNumber = 0
            }
        } else if operators[0] == .mul {
            if numberInStack[0] == 0 {
                numberInStack[0] = 1
                result = numberInStack[0] * numberInStack[1]
                screenNumber.text = String(Int(result))
                numberInStack.append(result)
                numberInStack.remove(at: 0)
                numberInStack.remove(at: 0)
                firstNumber = 0
            } else {
                result = numberInStack[0] * numberInStack[1]
                screenNumber.text = String(Int(result))
                numberInStack.append(result)
                numberInStack.remove(at: 0)
                numberInStack.remove(at: 0)
                firstNumber = 0
            }
        } else if operators[0] == .div {
            if numberInStack[0] == 0 && numberInStack.count == 1 {
                numberInStack[0] = 1
                if numberInStack[0] == 0 && numberInStack[1] == 0{
                    alert()
                } else {
                    result = numberInStack[0] / numberInStack[1]
                    screenNumber.text = "\(result)"
                    numberInStack.append(result)
                    numberInStack.remove(at: 0)
                    numberInStack.remove(at: 0)
                    firstNumber = 0
                }
            } else {
                if numberInStack[1] == 0 {
                    alert()
                } else {
                    result = numberInStack[0] / numberInStack[1]
                    screenNumber.text = "\(result)"
                    numberInStack.append(result)
                    numberInStack.remove(at: 0)
                    numberInStack.remove(at: 0)
                    firstNumber = 0
                }
            }
        }
    }
    
    @IBAction func operandTouchUpInside(_ sender: UIButton) {
        numberInStack.append(firstNumber)
        guard let mathOperation = MathOperation(rawValue: sender.tag) else { return }
        operand = mathOperation
        switch mathOperation {
        case .plus:
            configOperatorsArray()
            calculate()
        case .minus:
            if numberInStack[0] == 0 {
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
            if operators.count >= 2 && numberInStack.count >= 2 {
                operators.remove(at: 0)
                calculate()
                reset()
            } else if operators.count < 2 && numberInStack.count >= 2 {
                screenNumber.text = "\(firstNumber)"
            }
        case .reset:
            reset()
            screenNumber.text = "0"
        }
    }
    enum MathOperation: Int {
        case plus = 0
        case minus
        case mul
        case div
        case equal
        case reset
    }
}
