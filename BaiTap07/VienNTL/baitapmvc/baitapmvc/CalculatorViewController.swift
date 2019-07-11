//
//  CalculatorViewController.swift
//  baitapmvc
//
//  Created by Nguyen Truong Lam Vien on 7/4/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var handleButtonPress: [UIButton]!
    @IBOutlet private weak var resetValueButton: UIButton!
    
    private var firstNumberText = String()
    private var secondNumberText = String()
    private var operatorButtonText = String()
    private var isFirstNumber = true
    private var hasOperator = false
    private var canClear = true
    private var isContinuousOperation = false
    private var currentOperatorText = String()
    private var areTwoConsecutiveMarks = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton(handleButtonPress)
        
    }
    
    private func designButton(_ buttons: [UIButton]) {
        resetValueButton.layer.cornerRadius = 35
        for button in buttons {
            button.layer.cornerRadius = 35
        }
    }
    
    @IBAction func handleButtonTouchUpInside(_ sender: UIButton) {
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "＋", "×", "÷", "−":
                if hasOperator {
                    return
                }
                if !isContinuousOperation {
                    operatorButtonText = text
                    currentOperatorText = operatorButtonText
                    print(operatorButtonText)
                    isFirstNumber = false
                    hasOperator = false
                    resultLabel.text = ""
                    canClear = true
                    isContinuousOperation = true
                    print("không có dấu")
                    break
                }
                isFirstNumber = false
                canClear = true
                operatorButtonText = text
                currentOperatorText = operatorButtonText
                print(operatorButtonText)
                let result: Double = calculate()
                resultLabel.text = "\(result)"
                firstNumberText = "\(result)"
                hasOperator = false
                isContinuousOperation = true
                print("có dấu")
                break
            case "=":
                isFirstNumber = false
                hasOperator = true
                canClear = true
                isContinuousOperation = false
                let result: Double = calculate()
                resultLabel.text = "\(result)"
                firstNumberText = "\(result)"
                print(result)
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                    print(firstNumberText)
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                    print(secondNumberText)
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    @IBAction func resetValueButtonTouchUpInside(_ sender: Any) {
        firstNumberText = String()
        secondNumberText = String()
        operatorButtonText = String()
        currentOperatorText = String()
        isFirstNumber = true
        hasOperator = false
        resultLabel.text = "0"
        canClear = true
    }
    
    private func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        print("\(firstNumber), s2 = \(secondNumber)")
        firstNumberText = ""
        secondNumberText = ""
        switch operatorButtonText {
        case "＋":
            return firstNumber + secondNumber
        case "−":
            return firstNumber - secondNumber
        case "×":
            return firstNumber * secondNumber
        case "÷":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
}
