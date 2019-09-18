//
//  CalculatorViewController.swift
//  MVC
//
//  Created by MBA0217 on 9/3/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var containLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var operationButton: [UIButton]!
    
    var numberString = ""
    var operations: [MathOperation] = []
    var checkOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI () {
        //result Label
        containLabel.layer.borderWidth = 1
        containLabel.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    func showError() {
        resultLabel.text = "Error"
    }
    

    func calculate(mathOperation: MathOperation) {
        if operations.count > 0 {
            DataResult.shared.calculateResult(operation: operations[0])
            operations.remove(at: 0)
        }
        switch mathOperation {
        case .plus:
            DataResult.shared.calculateResult(operation: mathOperation)
            resultLabel.text = "\(Int(DataResult.shared.result))"
            operations.append(mathOperation)
        case .sub:
            if operations.count == 0 && DataResult.shared.result == 0.0 {
                DataResult.shared.result = DataResult.shared.number
                operations.append(mathOperation)
            } else {
                DataResult.shared.calculateResult(operation: mathOperation)
                operations.append(mathOperation)
            }
            resultLabel.text = "\(Int(DataResult.shared.result))"
        case .mul:
            DataResult.shared.result = DataResult.shared.result != 0 ? DataResult.shared.result : 1
            DataResult.shared.number = DataResult.shared.number != 0 ? DataResult.shared.number : 1
            DataResult.shared.calculateResult(operation: mathOperation)
            resultLabel.text = "\(Int(DataResult.shared.result))"
            operations.append(mathOperation)
         case .div:
            if !checkOperation {
                DataResult.shared.number = DataResult.shared.number != 0 ? DataResult.shared.number : 1
                
                if (DataResult.shared.result == 0) {
                    DataResult.shared.result = DataResult.shared.number
                    operations.append(mathOperation)
                } else {
                    DataResult.shared.calculateResult(operation: mathOperation)
                    resultLabel.text = "\(Int(DataResult.shared.result))"
                    operations.append(mathOperation)
                }
            } else {
                if DataResult.shared.number == 0 {
                    showError()
                } else {
                    if (DataResult.shared.result == 0) {
                        DataResult.shared.result = DataResult.shared.number
                        operations.append(mathOperation)
                    } else {
                        DataResult.shared.calculateResult(operation: mathOperation)
                        resultLabel.text = "\(Int(DataResult.shared.result))"
                        operations.append(mathOperation)
                    }
                }
            }
            
        case .result:
            DataResult.shared.number = 0
            resultLabel.text = "\(Int(DataResult.shared.result))"
        case .reset:
            resultLabel.text = "0"
            DataResult.shared.result = 0
            DataResult.shared.number = 0
        }
        numberString = ""
    }
    
    @IBAction func numberTouchUpInside(_ sender: UIButton) {
        
        if DataResult.shared.number == 0.0 && sender.tag == 0 {
            numberString = ""
            if operations.count > 0 {
                if operations[0] == .div && DataResult.shared.number == 0 {
                    showError()
                    return
                }
            }
        } else {
            numberString += "\(sender.tag)"
            DataResult.shared.number = Double(numberString)!
            resultLabel.text = numberString
        }
        checkOperation = true
    }
    
    @IBAction func operationTouchUpInside(_ sender: UIButton) {
        guard let mathOperation = MathOperation(rawValue: sender.tag) else { return }
        checkOperation = false
        calculate(mathOperation: mathOperation)
    }
    
    
}
