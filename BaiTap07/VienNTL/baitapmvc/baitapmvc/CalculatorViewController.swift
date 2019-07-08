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
    
    private var storeData: [Double] = [0]
    private var firstResult = 0.0
    private var result = 0.0
    
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
        firstResult = firstResult * 10 + Double(sender.tag - 1)
        resultLabel.text = "\(firstResult)"
    }
    
    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 11 {
            result = storeData[0] + firstResult
            resultLabel.text = "\(result)"
            storeData.removeAll()
            storeData.append(result)
            firstResult = 0.0
        } else if sender.tag == 12 {
            if storeData.count <= 1 && storeData[0] == 0 {
                result = 0
                storeData.removeAll()
                storeData.append(result)
            } else {
            result = storeData[0] - storeData[1]
            if storeData[0] == 0 {
                resultLabel.text = "\(abs(result))"
                storeData.removeAll()
                storeData.append(abs(result))
            }
            else {
                resultLabel.text = "\(result)"
                storeData.removeAll()
                storeData.append(result)
            }
            print("Bấm [-]: \(storeData)")
            firstResult = 0.0
            }
        } else if sender.tag == 16 {
            storeData.removeAll()
            resultLabel.text = "\(result)"
            firstResult = 0.0
        }
    }
}
