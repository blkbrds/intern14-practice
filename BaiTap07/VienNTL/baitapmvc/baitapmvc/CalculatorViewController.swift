//
//  CalculatorViewController.swift
//  baitapmvc
//
//  Created by Nguyen Truong Lam Vien on 7/4/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet private var numberButton: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var operatorButton: [UIButton]!
    
    private var firstNumber = Double()
    private var secondNumber = Double()
    private var result = 0.0
    private var keyPressed = String()
    private var finalResult = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton(numberButton)
        designButton(operatorButton)
    }
    
    private func designButton(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 35
        }
    }
    
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        keyPressed = sender.currentTitle!
        firstNumber = firstNumber * 10 + Double(keyPressed)!
        resultLabel.text = "\(firstNumber)"
    }
    
    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
         if sender.tag == 11 {
            result = firstNumber + secondNumber
            resultLabel.text = "\(result)"
            secondNumber = result
//            finalResult = result
            firstNumber = 0
        } else if sender.tag == 12 {
            result = secondNumber - firstNumber
            print("\(secondNumber) - \(firstNumber) = \(result)")
            resultLabel.text = "\(result)"
            secondNumber = firstNumber
//            finalResult = result
            if firstNumber == 0 {
                result = result - firstNumber
            } else {
                firstNumber = 0
            }
         } else if sender.tag == 13 {
            result = firstNumber * secondNumber
            resultLabel.text = "\(result)"
            secondNumber = result
//            finalResult = result
            firstNumber = 0
        } else if sender.tag == 14 {
            
        }
    }
    @IBAction func resetButtonTouchUpInside(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        finalResult = 0
        resultLabel.text = "0"
    }
    @IBAction func equalButtonTouchUpInside(_ sender: Any) {
    }
}
