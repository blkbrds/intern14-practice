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
    var operation: Int = 0
    var number1: Double = 0
    var result: Double = 0
    var number2: Double = 0
    var arr: [Double] = [0]
    var arr2: [Int] = [1]
    
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
        arr2.append(operation)
        if arr2.count > 2 {
            arr2.remove(at: 0)
        }
    }

    @IBAction func numberButton(_ sender: UIButton) {
        number1 = number1 * 10 + Double(sender.tag)
        resultLabel.text = "\(number1)"
        print(number1)
    }
    
    func resetInfo() {
        operation = 0
        number1 = 0
        result = 0
        number2 = 0
        arr = [0]
        arr2 = [1]
        
    }
    
    func alert() {
        let alert = UIAlertController(title: "Error", message: "Cannot divide by zero", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func calculate() {
        arr.append(number1)
        if arr2[0] == 1 {
            result = arr[0] + arr[1]
            resultLabel.text = "\(result)"
            arr.append(result)
            arr.remove(at: 0)
            arr.remove(at: 0)
            number2 = arr[0] + number1
            number1 = 0
        } else if arr2[0] == 2 {
                result = arr[0] - arr[1]
                resultLabel.text = "\(result)"
                arr.append(result)
                arr.remove(at: 0)
                arr.remove(at: 0)
                number2 = arr[0] + number1
                number1 = 0
        } else if arr2[0] == 3 {
            if arr[0] == 0 {
                arr[0] = 1
                result = arr[0] * arr[1]
                resultLabel.text = "\(result)"
                arr.append(result)
                arr.remove(at: 0)
                arr.remove(at: 0)
                number1 = 0
            } else {
                result = arr[0] * arr[1]
                resultLabel.text = "\(result)"
                arr.append(result)
                arr.remove(at: 0)
                arr.remove(at: 0)
                number1 = 0
            }
        } else if arr2[0] == 4 {
            if arr[0] == 0 {
                arr[0] = 1
                if arr[0] == 0 {
                    alert()
                } else {
                    result = arr[1] / arr[0]
                    resultLabel.text = "\(result)"
                    arr.append(result)
                    arr.remove(at: 0)
                    arr.remove(at: 0)
                    number1 = 0
                }
            } else {
                if arr[1] == 0 {
                    alert()
                } else {
                    result = arr[0] / arr[1]
                    resultLabel.text = "\(result)"
                    arr.append(result)
                    arr.remove(at: 0)
                    arr.remove(at: 0)
                    number1 = 0
                }
            }
        }
    }
    
    @IBAction func operateButton(_ sender: UIButton) {
        if sender.tag == 10 {
            operation = 1
            adjustOperandArray()
            calculate()
        } else if sender.tag == 11 {
            operation = 2
            if arr[0] == 0 {
                adjustOperandArray()
                arr2[0] = 2
                calculate()
            } else {
                adjustOperandArray()
                calculate()
            }
        } else if sender.tag == 12 {
            operation = 3
            adjustOperandArray()
            calculate()

        } else if sender.tag == 13 {
            operation = 4
            adjustOperandArray()
            calculate()
        } else if sender.tag == 14 {
            arr2.remove(at: 0)
            calculate()
            resetInfo()
            
        } else if sender.tag == 15 {
            resetInfo()
            resultLabel.text = "0"
        }
    }
}

