//
//  Ex05ViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/23/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex05ViewController: UIViewController {
    
    @IBOutlet var myButtonPicker: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        for button in myButtonPicker {
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func configUI() {
        title = " Ex05 "
        navigationController?.navigationBar.backgroundColor = .cyan
        
    }
    
    @IBAction func myPickerView(_ sender: UIButton) {
        navigationController?.pushViewController(MyPickerViewController(), animated: true)
    }
    
    @IBAction func myDayPickerView(_ sender: UIButton) {
        navigationController?.pushViewController(DayPickerViewViewController(), animated: true)
    }
    
}
