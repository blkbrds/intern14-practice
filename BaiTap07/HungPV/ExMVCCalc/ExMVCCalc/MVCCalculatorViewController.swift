//
//  MVCCalculatorViewController.swift
//  ExMVCCalc
//
//  Created by PCI0010 on 8/6/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

enum MathOp : Int {
    case cong = 10
    case tru
    case nhan
    case chia
    case bang
    case xoa
}

class MVCCalculatorViewController: UIViewController {
    //Mark: - Outlet
    
    @IBOutlet var numButton: [UIButton]!
    @IBOutlet var abc: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet var opButton: [UIButton]!
    
    var num1: Double = 0
    var num2: Double = 0
    var result: Double = 0
    var arrNum:[Double] = [0]
    var arrOp:[MathOp] = [.cong]
    var operate: MathOp = .xoa
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    //Mark: - Function
    func adjustOpArray() {
        arrOp.append(operate)
        if arrOp.count > 2 {
            arrOp.remove(at: 0)
        }
    }
    
    func error() {
        let alert = UIAlertController(title: "Error", message: "You Can't Divide By 0!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert,animated: true)
    }
    
    func reset(){
        operate = .xoa
        num1 = 0
        num2 = 0
        result = 0
        arrOp = [.cong]
        arrNum = [0]
    }
    
    func calc() {
        if arrOp[0] == .cong {
            result = arrNum[0] + arrNum[1]
            resultLabel.text = "\(result)"
            arrNum.append(result)
            arrNum.remove(at: 0)
            arrNum.remove(at: 0)
            num2 = arrNum[0] + num1
            num1 = 0
        } else if arrOp[0] == .tru {
            if arrNum[0] == 0 {
                result = arrNum[1]
                resultLabel.text = "\(result)"
                arrNum.append(result)
                arrNum.remove(at: 0)
                arrNum.remove(at: 0)
                num2 = arrNum[0] + num1
                num1 = 0
            } else {
                result = arrNum[0] - arrNum[1]
                resultLabel.text = "\(result)"
                arrNum.append(result)
                arrNum.remove(at: 0)
                arrNum.remove(at: 0)
                num2 = arrNum[0] + num1
                num1 = 0
            }
        } else if arrOp[0] == .nhan {
            if arrNum[0] == 0 {
                result = arrNum[0] * arrNum[1]
                resultLabel.text = "\(result)"
                arrNum.append(result)
                arrNum.remove(at: 0)
                arrNum.remove(at: 0)
                num1 = 0
            } else {
                result = arrNum[0] * arrNum[1]
                resultLabel.text = "\(result)"
                arrNum.append(result)
                arrNum.remove(at: 0)
                arrNum.remove(at: 0)
                num1 = 0
            }
        } else if arrOp[0] == .chia {
            if arrNum[0] == 0 && arrNum.count == 1 {
                arrNum[0] = 1
                if arrNum[0] == 0 && arrNum[1] == 0{
                    error()
                } else {
                    result = arrNum[0] / arrNum[1]
                    resultLabel.text = "\(result)"
                    arrNum.append(result)
                    arrNum.remove(at: 0)
                    arrNum.remove(at: 0)
                    num1 = 0
                }
            } else {
                if arrNum[1] == 0 {
                    error()
                } else {
                    result = arrNum[0] / arrNum[1]
                    resultLabel.text = "\(result)"
                    arrNum.append(result)
                    arrNum.remove(at: 0)
                    arrNum.remove(at: 0)
                    num1 = 0
                }
            }
        }
    }
    
    //Mark: - Action
    
    @IBAction func numButton(_ sender: UIButton) {
        if arrOp[0] == .tru && arrOp[1] == .tru && arrNum[0] == 0 {
            num1 = -(num1 * 10 + Double(sender.tag))
            resultLabel.text = String(num1)
        } else {
            num1 = num1 * 10 + Double(sender.tag)
            resultLabel.text = String(num1)
        }
    }
    
    @IBAction func opButton(_ sender: UIButton){
        arrNum.append(num1)
        guard let mathOp = MathOp(rawValue: sender.tag) else { return }
        operate = mathOp
        switch mathOp {
        case .cong:
            adjustOpArray()
            calc()
        case .tru:
            if arrNum[0] == 0 {
                adjustOpArray()
                arrOp[0] = .tru
                calc()
            } else {
                adjustOpArray()
                calc()
            }
        case .nhan:
            adjustOpArray()
            calc()
        case .chia:
            adjustOpArray()
            calc()
        case .bang:
            if arrOp.count >= 2 && arrNum.count >= 2 {
                arrOp.remove(at: 0)
                calc()
                reset()
            } else if arrOp.count < 2 && arrNum.count >= 2 {
                resultLabel.text = "\(num1)"
            }
        case .xoa:
            reset()
            resultLabel.text = "0"
        }
    }
}


