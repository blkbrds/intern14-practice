//
//  CalculatorViewController.swift
//  MVC
//
//  Created by Nguyen Duong on 7/4/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // Mark: - Properties
    @IBOutlet private weak var screenResulLabel: UILabel!
    @IBOutlet private var numberButtons: [UIButton]!

    // Mark: - Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderButton()
    }

    // Mark: - Private/public custom function
    private func setBorderButton() {
        view.backgroundColor = . black
        for item in numberButtons {
            item.layer.borderWidth = 1
            item.layer.cornerRadius = 45
        }
    }

    // Mark: - IBAction function
    @IBAction func numbersAction(_ sender: UIButton) {
        if OperationModel.shared.performingMath == true {
            screenResulLabel.adjustsFontSizeToFitWidth = true
            screenResulLabel.text = String(sender.tag)
            OperationModel.shared.numberOnScreen = Double(screenResulLabel.text!)!
            OperationModel.shared.performingMath = false
        } else {
            if Double(screenResulLabel.text!)! == 0 {
                screenResulLabel.text = "0"
                OperationModel.shared.performingMath = true
            } else if screenResulLabel.text?.count ?? 0 < 6 {
                screenResulLabel.adjustsFontSizeToFitWidth = true
                screenResulLabel.text = screenResulLabel.text! + String(sender.tag)
                OperationModel.shared.numberOnScreen = Double(screenResulLabel.text!)!
            }
        }
    }

    @IBAction func operatorButtonsAction(_ sender: UIButton) {
        if screenResulLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            OperationModel.shared.arrayNumber.append(OperationModel.shared.numberOnScreen)
            OperationModel.shared.operations.append(sender.tag)
            if sender.tag == 12 {
                // Divide
                if OperationModel.shared.arrayNumber.count >= 2 && OperationModel.shared.arrayNumber[1] != 0 {
                    switch OperationModel.shared.operation {
                    case 12:
                        screenResulLabel.text = String(OperationModel.shared.chia(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 13:
                        screenResulLabel.text = String(OperationModel.shared.nhan(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 14:
                        screenResulLabel.text = String(OperationModel.shared.tru(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 15:
                        screenResulLabel.text = String(OperationModel.shared.cong(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    default:
                        screenResulLabel.text = String(OperationModel.shared.chia(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                    }
                } else if OperationModel.shared.arrayNumber.count >= 2 && OperationModel.shared.arrayNumber[1] == 0 {
                    let errorInform = UIAlertController(title: "Error Devide Zero", message: "Not devide zero", preferredStyle: .alert)
                    errorInform.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(errorInform, animated: true, completion: nil)
                    screenResulLabel.text = "0"
                    OperationModel.shared.previousNumber = 0
                    OperationModel.shared.numberOnScreen = 0
                    OperationModel.shared.operation = 0
                    OperationModel.shared.performingMath = true
                    OperationModel.shared.arrayNumber.removeAll()
                    OperationModel.shared.operations.removeAll()
                    OperationModel.shared.tempOperation = 0
                }
            }
            if sender.tag == 13 {
                // Multiply
                if OperationModel.shared.arrayNumber.count >= 2 {
                    switch OperationModel.shared.operations[OperationModel.shared.tempOperation - 1] {
                    case 12:
                        screenResulLabel.text = String(OperationModel.shared.chia(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 13:
                        screenResulLabel.text = String(OperationModel.shared.nhan(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 14:
                        screenResulLabel.text = String(OperationModel.shared.tru(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 15:
                        screenResulLabel.text = String(OperationModel.shared.cong(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    default:
                        screenResulLabel.text = String(OperationModel.shared.nhan(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                    }
                }
            }
            if sender.tag == 14 {
                // Subtract
                if OperationModel.shared.arrayNumber.count >= 2 {
                    switch OperationModel.shared.operations[OperationModel.shared.tempOperation - 1] {
                    case 12:
                        screenResulLabel.text = String(OperationModel.shared.chia(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 13:
                        screenResulLabel.text = String(OperationModel.shared.nhan(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 14:
                        screenResulLabel.text = String(OperationModel.shared.tru(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 15:
                        screenResulLabel.text = String(OperationModel.shared.cong(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    default:
                        screenResulLabel.text = String(OperationModel.shared.tru(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                    }
                }
            }
            if sender.tag == 15 {
                //Add
                if OperationModel.shared.arrayNumber.count >= 2 {
                    switch OperationModel.shared.operations[OperationModel.shared.tempOperation - 1] {
                    case 12:
                        screenResulLabel.text = String(OperationModel.shared.chia(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 13:
                        screenResulLabel.text = String(OperationModel.shared.nhan(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 14:
                        screenResulLabel.text = String(OperationModel.shared.tru(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    case 15:
                        screenResulLabel.text = String(OperationModel.shared.cong(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                        break
                    default:
                        screenResulLabel.text = String(OperationModel.shared.cong(OperationModel.shared.arrayNumber[0], OperationModel.shared.arrayNumber[1]))
                        OperationModel.shared.arrayNumber.removeFirst()
                        OperationModel.shared.arrayNumber[0] = Double(screenResulLabel.text!)!
                    }
                }
            }
            OperationModel.shared.tempOperation += 1
            OperationModel.shared.operation = sender.tag
            OperationModel.shared.previousNumber = Double(screenResulLabel.text!)!
            OperationModel.shared.performingMath = true
        } else if sender.tag == 16 {
            if OperationModel.shared.operation == 12 {
                // Divide
                if OperationModel.shared.numberOnScreen != 0 {
                screenResulLabel.text = String(OperationModel.shared.chia(OperationModel.shared.previousNumber, OperationModel.shared.numberOnScreen))
                } else {
                    let errorInform = UIAlertController(title: "Error Devide Zero", message: "Not devide zero", preferredStyle: .alert)
                    errorInform.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(errorInform, animated: true, completion: nil)
                    screenResulLabel.text = "0"
                    OperationModel.shared.previousNumber = 0
                    OperationModel.shared.numberOnScreen = 0
                    OperationModel.shared.operation = 0
                    OperationModel.shared.performingMath = true
                    OperationModel.shared.arrayNumber.removeAll()
                    OperationModel.shared.operations.removeAll()
                    OperationModel.shared.tempOperation = 0
                }
            } else if OperationModel.shared.operation == 13 {
                // Multiply
                screenResulLabel.text = String(OperationModel.shared.nhan(OperationModel.shared.previousNumber, OperationModel.shared.numberOnScreen))
            } else if OperationModel.shared.operation == 14 {
                // Subtract
                screenResulLabel.text = String(OperationModel.shared.tru(OperationModel.shared.previousNumber, OperationModel.shared.numberOnScreen))
            } else if OperationModel.shared.operation == 15 {
                // Add
                screenResulLabel.text = String(OperationModel.shared.cong(OperationModel.shared.previousNumber, OperationModel.shared.numberOnScreen))
            }
            OperationModel.shared.performingMath = true
        } else if sender.tag == 11 {
            // Reset
            screenResulLabel.text = "0"
            OperationModel.shared.previousNumber = 0
            OperationModel.shared.numberOnScreen = 0
            OperationModel.shared.operation = 0
            OperationModel.shared.performingMath = true
            OperationModel.shared.arrayNumber.removeAll()
            OperationModel.shared.operations.removeAll()
            OperationModel.shared.tempOperation = 0
        }
    }
}
