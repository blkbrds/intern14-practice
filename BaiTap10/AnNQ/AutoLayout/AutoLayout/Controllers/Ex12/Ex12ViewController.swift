//
//  Ex12ViewController.swift
//  AutoLayout
//
//  Created by MBA0217 on 10/7/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex12ViewController: BaseViewController {

    @IBOutlet var calculatorButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex12"
        calculatorButtons.forEach { button in
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 5
        }
    }
    
    override func setupData() {
    }

}
