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
    
    @IBAction func numberButtonTouchUpInside(_ sender: UIButton) {
        resultLabel.text = resultLabel.text! + String(sender.tag - 1)
    }
    @IBAction func operatorButtonTouchUpInside(_ sender: Any) {
        
    }
}
