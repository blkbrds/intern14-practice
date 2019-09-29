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
    
    var isNew: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func insertValueToText(_ sender: UIButton) {
        if (isNew) {
            isNew = false
            numberText.text = nil
        } else {
            if (sender.currentTitle! == "+" || sender.currentTitle! == "-"
                || sender.currentTitle! == "*" || sender.currentTitle! == "/")
                &&  (numberText.text!.suffix(1) == "+" || numberText.text!.suffix(1) == "-"
                || numberText.text!.suffix(1) == "*" || numberText.text!.suffix(1) == "/") {
                numberText.text = String(numberText.text!.dropLast(1))
            }
        }

        numberText.text = numberText.text! + sender.currentTitle!
    }
    
    @IBAction func clearText(_ sender: UIButton) {
        isNew = true
        numberText.text = nil
    }
    
    @IBAction func calculateTextValue(_ sender: UIButton) {

        isNew = true
        let expr = NSExpression(format: numberText.text!)
        let result = expr.expressionValue(with: nil, context: nil) as? Double
        numberText.text = String(result!)

    }
    private func showMessage(message content: String) {
        // create the alert
        let alert = UIAlertController(title: "Error message", message: content, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}
