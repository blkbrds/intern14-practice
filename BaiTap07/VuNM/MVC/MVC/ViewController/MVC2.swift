//
//  MVC2.swift
//  MVC
//
//  Created by PCI0007 on 7/4/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class MVC2: UIViewController {
    
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var totalButton: [UIButton]!
    @IBOutlet var operateButton: [UIButton]!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var operation: MathOperation = .reset
    var number1: Double = 0
    var result: Double = 0
    var number2: Double = 0
    var listNumber: [Double] = [0]
    var listOperation: [MathOperation] = [.plus]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustDetails()
    }
    
    func adjustDetails() {
        for button in totalButton {
            button.layer.cornerRadius = button.bounds.width / 2
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        acButton.backgroundColor = .orange
        for button in numberButton {
            button.backgroundColor = UIColor(red: 52 / 255.0, green: 235 / 255.0, blue: 255 / 255.0, alpha: 1)
        }
        resultLabel.layer.cornerRadius = 20
        resultLabel.layer.borderColor = UIColor.black.cgColor
        resultLabel.layer.borderWidth = 2
    }
    
    func adjustOperandArray() {
        listOperation.append(operation)
        if listOperation.count > 2 {
            listOperation.remove(at: 0)
        }
    }
    
    func resetInfo() {
        operation = .reset
        number1 = 0
        result = 0
        number2 = 0
        listNumber = [0]
        listOperation = [.plus]
    }
    
    func alert() {
        let alert = UIAlertController(title: "Error", message: "The operation is invalid", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func calculate() {
        listNumber.append(number1)
        if listOperation[0] == .plus {
            result = listNumber[0] + listNumber[1]
            resultLabel.text = "\(result)"
            listNumber.append(result)
            listNumber.remove(at: 0)
            listNumber.remove(at: 0)
            number2 = listNumber[0] + number1
            number1 = 0
        } else if listOperation[0] == .minus {
            if listNumber[0] == 0 {
                print(listOperation)
                print(listNumber)
                result = listNumber[1]
                print(result)
                resultLabel.text = "\(result)"
                listNumber.append(result)
                print(listNumber)
                listNumber.remove(at: 0)
                print(listNumber)
                listNumber.remove(at: 0)
                print(listNumber)
                number2 = listNumber[0] + number1
                number1 = 0
            } else {
                print(listOperation)
                print(listNumber)
                result = listNumber[0] - listNumber[1]
                print(result)
                resultLabel.text = "\(result)"
                listNumber.append(result)
                listNumber.remove(at: 0)
                listNumber.remove(at: 0)
                number2 = listNumber[0] + number1
                number1 = 0
            }
        } else if listOperation[0] == .mul {
            if listNumber[0] == 0 {
                listNumber[0] = 1
                result = listNumber[0] * listNumber[1]
                resultLabel.text = "\(result)"
                listNumber.append(result)
                listNumber.remove(at: 0)
                listNumber.remove(at: 0)
                number1 = 0
            } else {
                result = listNumber[0] * listNumber[1]
                resultLabel.text = "\(result)"
                listNumber.append(result)
                listNumber.remove(at: 0)
                listNumber.remove(at: 0)
                number1 = 0
            }
        } else if listOperation[0] == .div {
            if listNumber[0] == 0 && listNumber.count == 1 {
                print(listNumber)
                listNumber[0] = 1
                print(listNumber)
                if listNumber[0] == 0 && listNumber[1] == 0{
                    alert()
                } else {
                    result = listNumber[0] / listNumber[1]
                    resultLabel.text = "\(result)"
                    listNumber.append(result)
                    listNumber.remove(at: 0)
                    listNumber.remove(at: 0)
                    number1 = 0
                }
            } else {
                if listNumber[1] == 0 {
                    alert()
                } else {
                    result = listNumber[0] / listNumber[1]
                    resultLabel.text = "\(result)"
                    listNumber.append(result)
                    listNumber.remove(at: 0)
                    listNumber.remove(at: 0)
                    number1 = 0
                }
            }
        }
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        if listOperation[0] == .minus && listOperation[1] == .minus && listNumber[0] == 0 {
            number1 = -(number1 * 10 + Double(sender.tag))
            resultLabel.text = String(number1)
        } else {
            number1 = number1 * 10 + Double(sender.tag)
            resultLabel.text = String(number1)
        }

        
    }
    
    @IBAction func operateButton(_ sender: UIButton) {
        guard let mathOperation = MathOperation(rawValue: sender.tag) else { return }
        operation = mathOperation
        switch mathOperation {
        case .plus:
            adjustOperandArray()
            calculate()
        case .minus:
            if listNumber[0] == 0 {
                adjustOperandArray()
                listOperation[0] = .minus
                calculate()
            } else {
                adjustOperandArray()
                calculate()
            }
        case .mul:
            adjustOperandArray()
            calculate()
        case .div:
            adjustOperandArray()
            calculate()
        case .equal:
            if listOperation.count < 2 {
                alert()
            } else {
                listOperation.remove(at: 0)
                calculate()
                resetInfo()
            }
        case .reset:
            resetInfo()
            resultLabel.text = "0"
        }
    }
}

enum MathOperation: Int {
    case plus = 10
    case minus
    case mul
    case div
    case equal
    case reset
}
