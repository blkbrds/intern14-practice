//
//  CalculateViewController.swift
//  MVCCalculator
//
//  Created by MBA0051 on 9/29/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var numberText: UITextField!
    
    var numbers: [NumberModel] = []
    var numberValue: String = ""
    var operand: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func insertValueToText(_ sender: UIButton) {
        if (sender.currentTitle! == "+" || sender.currentTitle! == "-"
            || sender.currentTitle! == "*" || sender.currentTitle! == "/") {
            // Change operand.
            if (numberText.text!.suffix(1) == "+" || numberText.text!.suffix(1) == "-"
            || numberText.text!.suffix(1) == "*" || numberText.text!.suffix(1) == "/") {

                numberText.text = String(numberText.text!.dropLast(1))
            }
            operand = sender.currentTitle!
        } else {
            // Start new.
            if (operand == "") {
                numberValue += sender.currentTitle!
            } else {
                // Add operand.
                let number = NumberModel(number: numberValue, operand: operand)
                numbers.append(number)
                operand = ""
                numberValue = sender.currentTitle!
            }
        }
        numberText.text = numberText.text! + sender.currentTitle!
    }
    
    @IBAction func clearText(_ sender: UIButton) {
        numberText.text = ""
    }
    
    @IBAction func calculateTextValue(_ sender: UIButton) {

        if (numberValue != "") {
            let number = NumberModel(number: numberValue, operand: operand)
            numbers.append(number)
        }

        var calculateLiterial = ""
        for index in 0..<numbers.count {
            calculateLiterial += numbers[index].number + numbers[index].operand
        }
        
        let expr = NSExpression(format: calculateLiterial)
        let result = expr.expressionValue(with: nil, context: nil) as? Double
        numberText.text = String(result!)
    }
}
